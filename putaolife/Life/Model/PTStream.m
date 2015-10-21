//
//  PTStream.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/20.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTStream.h"
#import "LogExtension.h"
#import "NSObject+Ex.h"
#import "PTCpInfo.h"

@implementation PTStream

+(instancetype)streamWithDict:(NSDictionary *)dict{
    PTStream *stream = [self new];
    [stream setValuesForKeysWithDictionary:dict];
    stream.desc = dict[@"description"];
    
    NSString *dictStr = dict[@"click_action"][@"cp_info"];
    NSDictionary *dictCp = [NSJSONSerialization JSONObjectWithData:[dictStr dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    stream.cpinfo = [PTCpInfo cpinfoWithDict:dictCp];
    
    return stream;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

- (NSString *) description{
    return [[self dictionaryWithValuesForKeys:self.propertys] descriptionWithLocale:[NSLocale localeWithLocaleIdentifier:@"zh-cn"]];
}

@end
