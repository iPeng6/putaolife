//
//  PTLikeChildView.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/17.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTLikeChildView.h"
#import "PTLike.h"
#import "Masonry.h"

@interface PTLikeChildView()
@property(nonatomic,strong) UIButton *btnName;
@property(nonatomic,strong) UILabel *lbDesc;
@end
@implementation PTLikeChildView

-(void)drawRect:(CGRect)rect{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, rect.size.width, 0);
    CGContextAddLineToPoint(ctx,rect.size.width, rect.size.height);
    CGContextSetLineWidth(ctx, 2);
    
    [RGB(233, 233, 233) setStroke];
    CGContextStrokePath(ctx);
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.btnName = [UIButton new];
        [self.btnName setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self addSubview:self.btnName];
        
        self.lbDesc = [UILabel new];
        self.lbDesc.font = [UIFont systemFontOfSize:14];
        self.lbDesc.textColor = RGB(100, 100, 100);
        [self addSubview:self.lbDesc];
        
        [self.btnName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(@15);
        }];
        
        [self.lbDesc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.btnName);
            make.top.equalTo(self.btnName.mas_bottom).offset(5);
        }];
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}
-(void)setLike:(PTLike *)like{
    _like = like;
    
    [self.btnName setImage:[UIImage imageNamed:like.small_icon_url] forState:UIControlStateNormal];
    [self.btnName setTitle:like.name forState:UIControlStateNormal];
    [self.btnName sizeToFit];
    self.lbDesc.text = like.desc;
    [self.btnName sizeToFit];
}
@end
