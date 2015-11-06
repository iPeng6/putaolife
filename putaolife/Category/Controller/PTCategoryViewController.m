//
//  PTCategoryViewController.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/7.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTCategoryViewController.h"
#import "NetworkTool.h"
#import "PTFunView.h"
#import "PTNav.h"
#import "PTCatLeftTableView.h"
#import "PTCatRightCollectView.h"
#import <Masonry.h>

@interface PTCategoryViewController ()

@property(nonatomic,strong) NSArray *navis;

@property(nonatomic,strong) PTCatLeftTableView *leftTable;
@property(nonatomic,strong) PTCatRightCollectView *rightCollect;

@end

@implementation PTCategoryViewController

#pragma mark - 懒加载
-(UITableView *)leftTable{
    if (_leftTable == nil) {
        _leftTable = [[PTCatLeftTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_leftTable];
        
        [_leftTable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(-1);
            make.top.equalTo(@64);
            make.bottom.equalTo(@49);
            make.width.equalTo(@70);
        }];
    }
    return _leftTable;
}

- (PTCatRightCollectView *)rightCollect{
    if (_rightCollect == nil) {
        _rightCollect = [[PTCatRightCollectView alloc] init];
        [self.view addSubview:_rightCollect];
        
        [_rightCollect mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftTable.mas_right);
            make.top.equalTo(self.view).offset(64);
            make.right.equalTo(self.view);
            make.bottom.equalTo(self.view);
        }];
    }
    return _rightCollect;
}

#pragma mark - 视图生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"分类";
    
    [self loadNav];
    [self loadNavis];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=YES;
    
}
#pragma mark -

/** 加载分类导航数据*/
- (void)loadNavis{
    NSURL *urlStr=[[NSBundle mainBundle] URLForResource:@"navis" withExtension:nil];
    [[NetworkTool sharedTool] request:NetworkToolMethodGet url:urlStr.absoluteString parameters:nil finished:^(id data, NSError *error) {
        if (!error) {
            NSMutableArray *arrM=[NSMutableArray array];
            NSArray *arrayDict=data[@"data"];
            [arrayDict enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
                [arrM addObject:[PTNav navWithDict:obj]];
            }];
            _navis=[arrM sortedArrayUsingComparator:^NSComparisonResult(PTNav *obj1, PTNav *obj2) {
                return obj1.sort>obj2.sort;
            }];
            
            self.leftTable.navis = _navis;
            self.rightCollect.navis = _navis;
        }
    }];

}

/** 加载自定义导航条*/
- (void)loadNav {
    UIView *nav=[[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 64)];
    [self.view addSubview:nav];
    nav.backgroundColor=RGB(52,174,131);
    
    //地理位置
    UIButton *btnArea=[[UIButton alloc] initWithFrame:CGRectMake(10, 20, 40, 40)];
    [nav addSubview:btnArea];
    [btnArea setTitle:@"北京" forState:UIControlStateNormal];
    [btnArea setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btnArea.titleLabel.font=[UIFont systemFontOfSize:15];
    
    //向下箭头
    UIImageView *imgArrow=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"putao_icon_home_xiala"]];
    imgArrow.frame=CGRectMake(CGRectGetMaxX(btnArea.frame), 35, 10, 10);
    [nav addSubview:imgArrow];
    
    //搜索框
    UIView *searchView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgArrow.frame)+20, 27.5, kScreenW-CGRectGetMaxX(imgArrow.frame)-30, 25)];
    
    searchView.backgroundColor = RGB(46,150,113);
    searchView.layer.masksToBounds = YES;
    searchView.layer.cornerRadius = 12;
    [nav addSubview:searchView];
    
    //搜索图标
    UIImageView *searchImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 3, 20, 20)];
    [searchImage setImage:[UIImage imageNamed:@"putao_icon_home_search_w"]];
    [searchView addSubview:searchImage];
    
    //搜索占位文字
    UILabel *lbPlaceHolder=[[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(searchImage.frame)+10, 0, searchView.frame.size.width-25, 25)];
    lbPlaceHolder.text=@"搜索团购、商家、服务";
    lbPlaceHolder.textColor=RGB(109, 182, 160);
    lbPlaceHolder.font=[UIFont systemFontOfSize:15];
    [searchView addSubview:lbPlaceHolder];
}
@end
