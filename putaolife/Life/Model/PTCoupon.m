//
//  PTCoupon.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/17.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTCoupon.h"

@implementation PTCoupon
+(instancetype)couponWithDict:(NSDictionary *)dict{
    PTCoupon *coupon = [self new];
    
    [coupon setValuesForKeysWithDictionary:dict];
    
    return coupon;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}
@end
