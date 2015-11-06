//
//  PTNactivityCellRight.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/19.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTNactivityCellRightView.h"
#import <Masonry.h>
#import "PTNactivity.h"
#import <UIImageView+WebCache.h>
#import "UIColor+Ex.h"

@interface PTNactivityCellRightView()
@property(nonatomic,strong) UILabel *lbTitle;
@property(nonatomic,strong) UILabel *lbSubTitle;
@property(nonatomic,strong) UIImageView *imgView;
@end
@implementation PTNactivityCellRightView
-(UILabel *)lbTitle{
    if (_lbTitle == nil) {
        _lbTitle = [UILabel new];
        _lbTitle.font = [UIFont systemFontOfSize:18];
        [self addSubview:_lbTitle];
        [_lbTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@30);
            make.left.equalTo(@10);
        }];
    }
    return _lbTitle;
}

-(UILabel *)lbSubTitle{
    if (_lbSubTitle == nil) {
        _lbSubTitle = [UILabel new];
        _lbSubTitle.font = [UIFont systemFontOfSize:13];
        _lbSubTitle.textColor = [UIColor darkGrayColor];
        [self addSubview:_lbSubTitle];
        [_lbSubTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_lbTitle.mas_bottom).offset(5);
            make.left.equalTo(_lbTitle);
        }];
    }
    return _lbSubTitle;
}

-(UIImageView *)imgView{
    if (_imgView == nil) {
        _imgView = [UIImageView new];
        [self addSubview:_imgView];
        [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self.mas_centerX).offset(5);
            make.width.equalTo(@80);
            make.height.equalTo(@90);
        }];
    }
    return _imgView;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderWidth = 1;
        self.layer.borderColor = RGB(233, 233, 233).CGColor;
    }
    return self;
}

-(void)setNactivity:(PTNactivity *)nactivity{
    _nactivity = nactivity;
    
    self.lbTitle.text = nactivity.title;
    self.lbTitle.textColor = [UIColor hexColor:nactivity.title_color];
    self.lbSubTitle.text = nactivity.subtitle;
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:nactivity.image_url]];
}

@end
