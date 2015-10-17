//
//  PTCouponCell.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/17.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTCouponCell.h"
#import "PTCoupon.h"
#import "UIImageView+WebCache.h"

@interface PTCouponCell()
@property(nonatomic,strong) NSMutableArray *imgViews;

@end
@implementation PTCouponCell
-(NSMutableArray *)imgViews{
    if (_imgViews == nil) {
        _imgViews = [NSMutableArray array];
    }
    return _imgViews;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        CGFloat padding = 7;
        CGFloat btnW = (kScreenW - padding*4)/3.0;
        CGFloat btnH = 100 - 2*padding;
        
        for (int i=0; i<3; ++i) {
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake((btnW+padding)*i+padding, padding, btnW, btnH)];
            [self.contentView addSubview:imgView];
            [self.imgViews addObject:imgView];
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake((btnW+padding)*i+padding, padding, btnW, btnH)];
            [btn setTitle:@"test" forState:UIControlStateNormal];
            [self.contentView addSubview:btn];
        }
       
    }
    return self;
}

-(void)setYouHuiCenter:(NSArray *)youHuiCenter{
    _youHuiCenter = youHuiCenter;
    
    for (int i=0; i<youHuiCenter.count; ++i) {
        PTCoupon *coupon = youHuiCenter[i];
        
        UIImageView *imgView = self.imgViews[i];
        [imgView sd_setImageWithURL:[NSURL URLWithString:coupon.coupon_url]];
    }
}
@end
