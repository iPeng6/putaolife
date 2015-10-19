//
//  PTService.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/10.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTService.h"
#import "LogExtension.h"
#import "NSObject+Ex.h"

@implementation PTService
+(instancetype)serviceWithDict:(NSDictionary *)dict{
    PTService *ser=[self new];
    ser.icon_url=dict[@"icon_url"];
    ser.name=dict[@"name"];
    ser.sort = [dict[@"sort"] integerValue];
    ser.show_title=dict[@"click_action"][@"show_title"];
    ser.click_link=dict[@"click_action"][@"click_link"];
    if (dict[@"dot_info"]) {
        ser.dot_text=dict[@"dot_info"][@"dot_text"];
    }
    return ser;
}
- (NSString *) description{
    return [[self dictionaryWithValuesForKeys:self.propertys] descriptionWithLocale:[NSLocale localeWithLocaleIdentifier:@"zh-cn"]];
}
@end
