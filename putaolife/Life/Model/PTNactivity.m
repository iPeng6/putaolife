//
//  PTNactivity.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/18.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTNactivity.h"
#import "LogExtension.h"
#import "NSObject+Ex.h"

@implementation PTNactivity

+(instancetype)nactivityWithDict:(NSDictionary *)dict{
    PTNactivity *nac = [self new];
    [nac setValuesForKeysWithDictionary:dict];
    
    nac.show_title=dict[@"click_action"][@"show_title"];
    nac.click_link=dict[@"click_action"][@"click_link"];
    
    return nac;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key{}

- (NSString *) description{
    return [[self dictionaryWithValuesForKeys:self.propertys] descriptionWithLocale:[NSLocale localeWithLocaleIdentifier:@"zh-cn"]];
}
@end
