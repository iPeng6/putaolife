//
//  PTCatRightCell.m
//  putaolife
//
//  Created by 彭玉良 on 15/11/6.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTCatRightCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>
#import "PTFunView.h"
#import "UIColor+Ex.h"

@interface PTCatRightCell()

@property(nonatomic,strong) UIImageView *icon;
@property(nonatomic,strong) UILabel *lbName;
@property(nonatomic,strong) UILabel *lbDesc;

@end

@implementation PTCatRightCell

- (UIImageView *)icon{
    if (_icon == nil) {
        _icon = [UIImageView new];
        [self.contentView addSubview:_icon];
        
        [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(@10);
            make.width.height.equalTo(@32);
        }];
    }
    return _icon;
}

- (UILabel *)lbName{
    if (_lbName == nil) {
        _lbName = [UILabel new];
        [self.contentView addSubview:_lbName];
        
        _lbName.font = [UIFont systemFontOfSize:14];
        _lbName.textColor = [UIColor darkGrayColor];
        
        [_lbName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.icon);
            make.top.equalTo(self.icon.mas_bottom).offset(10);
        }];
    }
    return _lbName;
}

- (UILabel *)lbDesc{
    if (_lbDesc == nil) {
        _lbDesc = [UILabel new];
        [self.contentView addSubview:_lbDesc];
        
        _lbDesc.font = [UIFont systemFontOfSize:11];
        _lbDesc.textColor = [UIColor lightGrayColor];
        
        [_lbDesc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.lbName);
            make.top.equalTo(self.lbName.mas_bottom).offset(5);
        }];
    }
    return _lbDesc;
}

- (void)setFunview:(PTFunView *)funview{
    _funview = funview;
    if ([funview.small_icon_url containsString:@"http"]) {
        [self.icon sd_setImageWithURL:[NSURL URLWithString:funview.small_icon_url]];
    }else{
        self.icon.image = [UIImage imageNamed:funview.small_icon_url];
    }
    
    self.lbName.text = funview.name;
    self.lbName.textColor = [UIColor hexColor:funview.name_color];
    
    self.lbDesc.text = funview.desc;
}
@end
