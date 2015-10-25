//
//  PTClickAction.h
//  putaolife
//
//  Created by 彭玉良 on 15/10/23.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 "expend_params" : "",
 "click_activity" : "so.contacts.hub.ui.yellowpage.YellowPageDetailActivity",
 "click_type" : 2,
 "click_link" : "http:\/\/www.chunyuyisheng.com\/ehr\/ask_service",
 "cp_info" : "",
 "pt_h5" : 1,
 "show_title" : "春雨医生"
 */
@interface PTClickAction : NSObject
@property(nonatomic,copy) NSString *expend_params;
@property(nonatomic,copy) NSString *click_activity;
@property(nonatomic,assign)NSInteger click_type;
@property(nonatomic,copy) NSString *click_link;
@property(nonatomic,copy) NSString *cp_info;
@property(nonatomic,assign)NSInteger pt_h5;
@property(nonatomic,copy) NSString *show_title;

+(instancetype)clickActionWithDict:(NSDictionary *)dict;
@end
