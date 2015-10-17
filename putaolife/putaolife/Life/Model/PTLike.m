//
//  PTLike.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/17.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTLike.h"

@implementation PTLike
+(instancetype)likeWithDict:(NSDictionary *)dict{
    PTLike *like = [self new];
    
    like.small_icon_url = dict[@"small_icon_url"];
    like.name = dict[@"name"];
    like.desc = dict[@"desc"];
    like.click_link = dict[@"click_action"][@"click_link"];
    like.show_title = dict[@"click_action"][@"show_title"];
    
    return like;
}
@end
