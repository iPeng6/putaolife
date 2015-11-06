//
//  PTLifeHeadView.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/10.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTLifeHeadView.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "PTAdBeans.h"
#import "UIView+Ex.h"

@implementation PTLifeHeadView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        //初始化
        UIImageView *imgRefresh=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"putao_home_refresh"]];
        [self addSubview:imgRefresh];
        
        [imgRefresh mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(self.mas_top);
        }];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame clickBlock:(PTLifeHeadViewClickBlock)clickBlock{
    if (self=[self initWithFrame:frame]) {
        self.clickBlock=clickBlock;
    }
    return self;
}

-(void)setAdActivitys:(NSArray *)adActivitys{
    _adActivitys=adActivitys;
    
    CGFloat padding=8;
    CGFloat imgW=(kScreenW-3*padding)*0.5;
    CGFloat imgH=90;
    
    //根据数据重设头视图高度
    UITableView *tableView=(UITableView *)self.superview;
    [tableView beginUpdates];
    self.sizeH=68+98*(adActivitys.count/2);
    tableView.tableHeaderView=self;
    [tableView endUpdates];
    
    
    //创建广告元素
    for (int i=0; i<adActivitys.count; ++i) {
        PTAdBeans *adBean=adActivitys[i];
        UIImageView *imgView=[[UIImageView alloc] init];
        [self addSubview:imgView];
        
        [imgView sd_setImageWithURL:[NSURL URLWithString:adBean.image_url] placeholderImage:[UIImage imageNamed:@"putao_home_refresh"]];
        
        int col=i%2;
        int row=i/2;
        CGFloat imgX=padding+(imgW+padding)*col;
        CGFloat imgY=padding+(imgH+padding)*row+64;
        imgView.frame=CGRectMake(imgX, imgY, imgW, imgH);
        UIButton *btn=[[UIButton alloc] initWithFrame:imgView.frame];
        btn.tag=i;
        [self addSubview:btn];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)btnClick:(UIButton *)sender{
    PTAdBeans *adBean=self.adActivitys[sender.tag];
    NSLog(@"%@",adBean.click_link);
    if (self.clickBlock) {
        self.clickBlock(adBean.click_link,adBean.show_title);
    }
}
@end
