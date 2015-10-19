//
//  PTCoupon.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/17.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTCoupon.h"
#import "LogExtension.h"
#import "NSObject+Ex.h"

@implementation PTCoupon
+(instancetype)couponWithDict:(NSDictionary *)dict{
    PTCoupon *coupon = [self new];
    
    [coupon setValuesForKeysWithDictionary:dict];
    
    return coupon;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

- (NSString *) description{
    return [[self dictionaryWithValuesForKeys:self.propertys] descriptionWithLocale:[NSLocale localeWithLocaleIdentifier:@"zh-cn"]];
}
@end
