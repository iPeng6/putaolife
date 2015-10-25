//
//  PTFunView.m
//  putaolife
//
//  Created by 彭玉良 on 15/10/23.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTFunView.h"

@implementation PTFunView
+(instancetype)funViewWithDict:(NSDictionary *)dict{
    PTFunView *fun = [self new];
    [fun setValuesForKeysWithDictionary:dict];
    return fun;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}

@end

