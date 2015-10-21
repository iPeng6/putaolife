//
//  PTCp_info.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/20.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTCpInfo.h"
#import "LogExtension.h"
#import "NSObject+Ex.h"

@implementation PTCpInfo
+(instancetype)cpinfoWithDict:(NSDictionary *)dict{
    PTCpInfo *info = [self new];
    
    [info setValuesForKeysWithDictionary:dict];
    
    return info;
}

-(void)setValue:(id)value forKey:(NSString *)key{
    [super setValue:value forKey:key];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

- (NSString *) description{
    return [[self dictionaryWithValuesForKeys:self.propertys] descriptionWithLocale:[NSLocale localeWithLocaleIdentifier:@"zh-cn"]];
}

@end
