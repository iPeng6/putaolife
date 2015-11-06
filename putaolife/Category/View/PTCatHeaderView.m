//
//  PTCatHeaderView.m
//  putaolife
//
//  Created by 彭玉良 on 15/11/6.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTCatHeaderView.h"
#import <Masonry.h>

@interface PTCatHeaderView()

@property(nonatomic,strong) UILabel *lbName;
@property(nonatomic,strong) UIImageView *leftLine;
@property(nonatomic,strong) UIImageView *rightLine;

@end

@implementation PTCatHeaderView

- (UILabel *)lbName{
    if (_lbName == nil) {
        _lbName = [UILabel new];
        [self addSubview:_lbName];
        
        _lbName.font = [UIFont systemFontOfSize:14];
        _lbName.textColor = [UIColor lightGrayColor];
        
        [_lbName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
    }
    return _lbName;
}

- (UIImageView *)leftLine{
    if (_leftLine == nil) {
        _leftLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"putao_icon_cateory_leftline"]];
    }
    return _leftLine;
}

- (UIImageView *)rightLine{
    if (_rightLine == nil) {
        _rightLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"putao_icon_cateory_rightline"]];
    }
    return _rightLine;
}


- (void)setName:(NSString *)name{
    _name = name;
    self.lbName.text = name;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.leftLine];
        [self addSubview:self.rightLine];
        
        [self.leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.equalTo(self.lbName.mas_left).offset(-10);
            make.left.equalTo(self).offset(10);
            make.height.equalTo(@1);
        }];
        
        [self.rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self.lbName.mas_right).offset(10);
            make.right.equalTo(self).offset(-10);
            make.height.equalTo(@1);
        }];
    }
    return self;
}

@end