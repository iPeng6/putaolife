//
//  PTAdBeans.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/9.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTAdBeans.h"

@implementation PTAdBeans

+(instancetype)adBeansWithDict:(NSDictionary *)dict{
    PTAdBeans *ad=[self new];
    dict=dict[@"ad_beans"][0];
    ad.image_url=dict[@"image_url"];
    ad.show_title=dict[@"click_action"][@"show_title"];
    ad.click_link=dict[@"click_action"][@"click_link"];
    return ad;
}

@end
