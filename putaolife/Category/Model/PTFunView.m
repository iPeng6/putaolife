//
//  PTFunView.m
//  putaolife
//
//  Created by 彭玉良 on 15/10/23.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTFunView.h"
#import "LogExtension.h"
#import "NSObject+Ex.h"

@implementation PTFunView
+(instancetype)funViewWithDict:(NSDictionary *)dict{
    PTFunView *fun = [self new];
    [fun setValuesForKeysWithDictionary:dict];
    
    
    return fun;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{}

- (NSString *) description{
    return [[self dictionaryWithValuesForKeys:self.propertys] descriptionWithLocale:[NSLocale localeWithLocaleIdentifier:@"zh-cn"]];
}

@end

