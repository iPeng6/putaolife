//
//  PTMeHeadView.m
//  putaolife
//
//  Created by 彭玉良 on 15/11/8.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTMeHeadView.h"
#import <Masonry.h>

@interface PTMeHeadView()
@property(nonatomic,strong) UIButton *headIcon;
@property(nonatomic,strong) UILabel *title;
@property(nonatomic,strong) UILabel *subTitle;
@end

@implementation PTMeHeadView

- (UIButton *)headIcon{
    if (_headIcon == nil) {
        _headIcon = [[UIButton alloc] init];
        [_headIcon setImage:[UIImage imageNamed:@"putao_menu_acc_headimg_logined"] forState:UIControlStateNormal];
        _headIcon.layer.cornerRadius = 30;
        _headIcon.clipsToBounds = YES;
//        [_headIcon sizeToFit];
    }
    return _headIcon;
}

- (UILabel *)title{
    if (_title == nil) {
        _title = [UILabel new];
        _title.text = @"点击头像登录";
        _title.textColor = [UIColor whiteColor];
    }
    return _title;
}

- (UILabel *)subTitle{
    if (_subTitle == nil) {
        _subTitle = [UILabel new];
        _subTitle.text = @"登录后可同步您的订单信息";
        _subTitle.font = [UIFont systemFontOfSize:14];
        _subTitle.textColor = RGB(140, 220, 200);
    }
    return _subTitle;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.headIcon];
        [self addSubview:self.title];
        [self addSubview:self.subTitle];
        
        [self.headIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-36);
            make.left.equalTo(self).offset(40);
            make.width.height.equalTo(@80);
        }];
        
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.headIcon);
            make.left.equalTo(self.headIcon.mas_right).offset(15);
        }];
        
        [self.subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.title);
            make.top.equalTo(self.title.mas_bottom).offset(5);
        }];
    }
    return self;
}

@end
