//
//  PTNav.m
//  putaolife
//
//  Created by 彭玉良 on 15/11/4.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTNav.h"
#import "LogExtension.h"
#import "NSObject+Ex.h"
#import "PTFunView.h"

@implementation PTNav

+(instancetype)navWithDict:(NSDictionary *)dict{
    PTNav *nav = [self new];
    [nav setValuesForKeysWithDictionary:dict];
    
    NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:nav.fun_views.count];
    [nav.fun_views enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [arrM addObject:[PTFunView funViewWithDict:obj]];
    }];
    nav.fun_views = arrM;
    return nav;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}

@end
