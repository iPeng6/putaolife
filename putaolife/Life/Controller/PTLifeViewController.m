//
//  PTLifeViewController.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/7.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "AFNetworking.h"
#import "UIImageView+WebCache.h"
#import "Masonry.h"

#import "PTLifeViewController.h"
#import "PTWebViewController.h"

#import "PTAdBeans.h"
#import "PTService.h"
#import "PTLike.h"
#import "PTCoupon.h"
#import "PTNactivity.h"
#import "PTCpInfo.h"
#import "PTStream.h"

#import "PTBaseTableCell.h"
#import "PTLifeHeadView.h"
#import "PTServiceCell.h"
#import "PTLikeCell.h"
#import "PTCouponCell.h"
#import "PTNactivityCell.h"
#import "PTStreamCell.h"

#import "NetworkTool.h"

@interface PTLifeViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView *mainTableView;

@property(nonatomic,strong) NSArray *adActivitys;//广告活动
@property(nonatomic,strong) NSArray *baseServices;//8个基础服务
@property(nonatomic,strong) NSArray *guessNeeds;//猜你需要
@property(nonatomic,strong) NSArray *youHuiCenter;//优惠中心
@property(nonatomic,strong) NSArray *nactivities;//本地服务
@property(nonatomic,strong) NSArray *streams;//精选

@end
@implementation PTLifeViewController

#pragma mark - 懒加载
-(NSArray *)adActivitys{
    if (_adActivitys==nil) {
        _adActivitys=[NSArray array];
    }
    return _adActivitys;
}
-(NSArray *)baseServices{
    if (_baseServices==nil) {
        _baseServices=[NSArray array];
    }
    return _baseServices;
}
-(NSArray *)guessNeeds{
    if (_guessNeeds==nil) {
        _guessNeeds=[NSArray array];
    }
    return _guessNeeds;
}
-(NSArray *)youHuiCenter{
    if (_youHuiCenter==nil) {
        _youHuiCenter=[NSArray array];
    }
    return _youHuiCenter;
}
-(NSArray *)nactivities{
    if (_nactivities==nil) {
        _nactivities=[NSArray array];
    }
    return _nactivities;
}
-(NSArray *)streams{
    if (_streams==nil) {
        _streams=[NSArray array];
    }
    return _streams;
}

-(UITableView *)mainTableView{
    if (_mainTableView==nil) {
        _mainTableView=[[UITableView alloc] initWithFrame:CGRectMake(0, -20, kScreenW, kScreenH+20) style:UITableViewStyleGrouped];
        [self.view addSubview:_mainTableView];
        _mainTableView.dataSource=self;
        _mainTableView.delegate=self;
        _mainTableView.showsVerticalScrollIndicator=NO;
        _mainTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _mainTableView;
}
#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"生活";
    
    //加载数据
    [self loadData];
    
    //加载表头视图
    [self loadHeadView];
    
    //加载自定义导航条
    [self loadNav];
    
    
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=YES;
}

#pragma mark - 加载网络数据

/** 加载数据*/
- (void)loadData{
    //加载广告活动
    [self loadAdActivitys];
    
    //加载基础服务
    [self loadBaseServices];
    
    //加载猜你需要
    [self loadLikes];
    
    //加载团购优惠
    [self loadCoupons];
    
    //加载本地服务
    [self loadNactivities];
    
    //加载精选
    [self loadStreams];
}

/** 加载广告活动*/
- (void)loadAdActivitys {
    NSURL *urlStr=[[NSBundle mainBundle] URLForResource:@"ads" withExtension:nil];
    
    [[NetworkTool sharedTool] request:NetworkToolMethodGet url:urlStr.absoluteString parameters:nil finished:^(id data, NSError *error) {
        if (!error) {
            NSMutableArray *arrM=[NSMutableArray array];
            NSArray *arrayDict=data[@"data"];
            [arrayDict enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
                [arrM addObject:[PTAdBeans adBeansWithDict:obj]];
            }];
            _adActivitys=[arrM sortedArrayUsingComparator:^NSComparisonResult(PTAdBeans *obj1, PTAdBeans *obj2) {
                return obj1.sort>obj2.sort;
            }];
            
            [self.mainTableView.tableHeaderView setValue:self.adActivitys forKey:@"adActivitys"];
        }
    }];
}

/** 加载基础服务*/
- (void)loadBaseServices{
    NSURL *urlStr=[[NSBundle mainBundle] URLForResource:@"services" withExtension:nil];
    [[NetworkTool sharedTool] request:NetworkToolMethodGet url:urlStr.absoluteString parameters:nil finished:^(id data, NSError *error) {
        if (!error) {
            NSMutableArray *arrM=[NSMutableArray array];
            NSArray *arrayDict=data[@"data"];
            [arrayDict enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
                [arrM addObject:[PTService serviceWithDict:obj]];
            }];
            _baseServices=[arrM sortedArrayUsingComparator:^NSComparisonResult(PTService *obj1, PTService *obj2) {
                return obj1.sort>obj2.sort;
            }];
            
            [self.mainTableView reloadData];
        }
    }];
}

/** 加载猜你需要*/
-(void)loadLikes{
    NSURL *urlStr=[[NSBundle mainBundle] URLForResource:@"likes" withExtension:nil];
    [[NetworkTool sharedTool] request:NetworkToolMethodGet url:urlStr.absoluteString parameters:nil finished:^(id data, NSError *error) {
        if (!error) {
            NSMutableArray *arrM=[NSMutableArray array];
            NSArray *arrayDict=data[@"data"][0][@"fun_views"];
            [arrayDict enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
                [arrM addObject:[PTLike likeWithDict:obj]];
            }];
            _guessNeeds=[arrM sortedArrayUsingComparator:^NSComparisonResult(PTLike *obj1, PTLike *obj2) {
                return obj1.sort>obj2.sort;
            }];
            
            [self.mainTableView reloadData];
        }
    }];
}

/** 加载团购优惠*/
-(void)loadCoupons{
    NSURL *urlStr=[[NSBundle mainBundle] URLForResource:@"cmscoupons" withExtension:nil];
    [[NetworkTool sharedTool] request:NetworkToolMethodGet url:urlStr.absoluteString parameters:nil finished:^(id data, NSError *error) {
        if (!error) {
            NSMutableArray *arrM=[NSMutableArray array];
            NSArray *arrayDict=data[@"data"];
            [arrayDict enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
                [arrM addObject:[PTCoupon couponWithDict:obj]];
            }];
            _youHuiCenter=[arrM sortedArrayUsingComparator:^NSComparisonResult(PTCoupon *obj1, PTCoupon *obj2) {
                return obj1.sort>obj2.sort;
            }];
            
            [self.mainTableView reloadData];
        }
    }];
}

/** 加载本地服务*/
-(void)loadNactivities{
    NSURL *urlStr=[[NSBundle mainBundle] URLForResource:@"nactivities" withExtension:nil];
    [[NetworkTool sharedTool] request:NetworkToolMethodGet url:urlStr.absoluteString parameters:nil finished:^(id data, NSError *error) {
        if (!error) {
            NSMutableArray *arrM=[NSMutableArray array];
            NSArray *arrayDict=data[@"data"];
            [arrayDict enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
                [arrM addObject:[PTNactivity nactivityWithDict:obj]];
            }];
            
            _nactivities = [arrM sortedArrayUsingComparator:^NSComparisonResult(PTNactivity *obj1, PTNactivity *obj2) {
                return obj1.sort>obj2.sort;
            }];
            
            [self.mainTableView reloadData];
        }
    }];
}

/** 加载精选*/
-(void)loadStreams{
    NSURL *urlStr=[[NSBundle mainBundle] URLForResource:@"streams" withExtension:nil];
    [[NetworkTool sharedTool] request:NetworkToolMethodGet url:urlStr.absoluteString parameters:nil finished:^(id data, NSError *error) {
        if (!error) {
            NSMutableArray *arrM=[NSMutableArray array];
            NSArray *arrayDict=data[@"data"][@"content_views"][0][@"content_beans"];
            [arrayDict enumerateObjectsUsingBlock:^(NSDictionary *obj, NSUInteger idx, BOOL *stop) {
                [arrM addObject:[PTStream streamWithDict:obj]];
            }];
            
            _streams = [arrM sortedArrayUsingComparator:^NSComparisonResult(PTStream *obj1, PTStream *obj2) {
                return obj1.sort>obj2.sort;
            }];

            [self.mainTableView reloadData];
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

/** 加载表头视图*/
- (void)loadHeadView {
    PTLifeHeadView *headView = [[PTLifeHeadView alloc] initWithFrame:CGRectMake(0, 0, kScreenW, 150) clickBlock:^(NSString *urlStr,NSString *title) {
        PTWebViewController *webViewCtrl=[[PTWebViewController alloc] initWithUrlStr:urlStr title:title];
        
        [self.navigationController pushViewController:webViewCtrl animated:YES];
    }];
    headView.backgroundColor=RGB(239, 239, 244);
    self.mainTableView.tableHeaderView=headView;
}

#pragma mark -

#pragma mark - 数据源方法

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0||section==3) {
        return 1;
    }else if (section==1||section==2){
        return 2;
    }else{
        return  self.streams.count+1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *const kReuseId=@"cell";
    PTBaseTableCell *cell=[tableView dequeueReusableCellWithIdentifier:kReuseId];
    if (cell==nil) {
        cell=[[PTBaseTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kReuseId];
    }
    cell.textLabel.text=nil;
    if (indexPath.section==0) {
        static NSString *const kServiceReuseId=@"serviceCell";
        PTServiceCell *cell=[tableView dequeueReusableCellWithIdentifier:kServiceReuseId];
        if (cell==nil) {
            cell=[[PTServiceCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kServiceReuseId];
        }
        
        cell.baseServices=self.baseServices;
        return cell;
    }
    else if (indexPath.section==1) {
        if (indexPath.row==0) {
            cell.textLabel.text=@"猜你需要";
        }else{
            static NSString *const kLikeReuseId=@"likeCell";
            PTLikeCell *cell=[tableView dequeueReusableCellWithIdentifier:kLikeReuseId];
            if (cell==nil) {
                cell=[[PTLikeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kLikeReuseId];
            }
            
            cell.guessNeeds = self.guessNeeds;
            return cell;
        }
    }else if(indexPath.section == 2) {
        if (indexPath.row==0) {
            cell.textLabel.text=@"优惠中心";
        }else{
            static NSString *const kCouponReuseId=@"couponCell";
            PTCouponCell *cell=[tableView dequeueReusableCellWithIdentifier:kCouponReuseId];
            if (cell==nil) {
                cell=[[PTCouponCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCouponReuseId];
            }
            
            cell.youHuiCenter = self.youHuiCenter;
            return cell;
        }
    }else if(indexPath.section == 3){
        static NSString *const kNactivityReuseId=@"nactivityCell";
        PTNactivityCell *cell=[tableView dequeueReusableCellWithIdentifier:kNactivityReuseId];
        if (cell==nil) {
            cell=[[PTNactivityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kNactivityReuseId];
        }
        
        cell.nactivities = self.nactivities;
        return cell;
    }
    else if (indexPath.section==4){
        if (indexPath.row==0) {
            cell.textLabel.text=@"精选";
        }else{
            static NSString *const kSteamReuseId=@"streamCell";
            PTStreamCell *cell=[tableView dequeueReusableCellWithIdentifier:kSteamReuseId];
            if (cell==nil) {
                cell=[[PTStreamCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kSteamReuseId];
            }
            
            cell.stream = self.streams[indexPath.row-1];
            return cell;
        }
    }
    
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        return 190;
    }else if (indexPath.section==1){
        if (indexPath.row==0) {
            return 34;
        }
        return 85;
    }else if (indexPath.section==2){
        if (indexPath.row==0) {
            return 34;
        }
        return 100;
    }else if (indexPath.section==3){
        return 190;
    }else if(indexPath.section==4){
        if (indexPath.row==0) {
            return 34;
        }
        return 92;
    }else{
        return 70;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

#pragma mark -

@end
