//
//  PTMeViewController.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/7.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTMeViewController.h"
#import "UIColor+Ex.h"
#import "PTMeCell.h"
#import "PTMeHeadView.h"

@interface PTMeViewController ()<UITableViewDataSource, UITableViewDelegate>
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) UIImageView *imgBgView;
@end

@implementation PTMeViewController

- (UITableView *)tableView{
    if (_tableView == nil) {

        CGRect rect = self.view.frame;
        rect.origin.y -= 102;
        rect.size.height += 102;
        _tableView = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
        
        self.tableView.backgroundColor = [[UIColor alloc] initWithWhite:0.95 alpha:1.0];
        self.tableView.rowHeight = 58;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 60, 0, 0);
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"我";
    
    [self prepareHeaderView];
    self.tableView.tableFooterView = [UIView new];
    
    [self.tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:NULL];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    CGPoint p = [change[@"new"] CGPointValue];
    
    if(p.y<=-60){
        CGFloat offset = p.y+60;
        
        self.imgBgView.frame = CGRectMake(offset*0.5, offset, kScreenW-offset, 250-offset);
        
    }
    NSLog(@"%f",p.y);
}

- (void)prepareHeaderView{
    PTMeHeadView *headView = [PTMeHeadView new];

    headView.frame = CGRectMake(0, 0, kScreenW, 250);
    
    self.imgBgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"putao_menu_acc_layout_bg"]];
    self.imgBgView.frame = headView.frame;
    [headView insertSubview:self.imgBgView atIndex:0];
    
    self.tableView.tableHeaderView = headView;
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden=YES;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 3;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    PTMeCell *cell = [PTMeCell cell:tableView];
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"putao_icon_me_wddd"];
            cell.textLabel.text = @"我的订单";
        }else if (indexPath.row == 1){
            cell.imageView.image = [UIImage imageNamed:@"putao_icon_me_yhhd"];
            cell.textLabel.text = @"我的优惠";
        }else{
            cell.imageView.image = [UIImage imageNamed:@"putao_icon_me_wdtg"];
            cell.textLabel.text = @"我的团购";
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            cell.imageView.image = [UIImage imageNamed:@"putao_icon_me_gywm"];
            cell.textLabel.text = @"关于我们";
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (void)dealloc{
    [self.tableView removeObserver:self forKeyPath:@"contentOffset"];
}

@end
