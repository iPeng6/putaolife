//
//  PTFunView.h
//  putaolife
//
//  Created by 彭玉良 on 15/10/23.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@class PTClickAction;
@interface PTFunView : NSObject
@property(nonatomic,copy) NSString *small_icon_url;
@property(nonatomic,copy) NSString *desc;
@property(nonatomic,copy) NSString *name_color;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign)NSInteger sort;
@property(nonatomic,copy) PTClickAction *click_action;

+(instancetype)funViewWithDict:(NSDictionary *)dict;
@end
