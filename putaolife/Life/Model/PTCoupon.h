//
//  PTCoupon.h
//  putaolife
//
//  Created by 玉良彭 on 15/10/17.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTCoupon : NSObject
@property(nonatomic,copy) NSString *coupon_url;
@property(nonatomic,assign)NSInteger sort;

+(instancetype) couponWithDict:(NSDictionary *)dict;
@end
