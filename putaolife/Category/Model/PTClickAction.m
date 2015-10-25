//
//  PTClickAction.m
//  putaolife
//
//  Created by 彭玉良 on 15/10/23.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTClickAction.h"

@implementation PTClickAction
+(instancetype)clickActionWithDict:(NSDictionary *)dict{
    PTClickAction *ca = [self new];
    [ca setValuesForKeysWithDictionary:dict];
    return ca;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}

@end
