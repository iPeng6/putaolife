//
//  PTService.h
//  putaolife
//
//  Created by 玉良彭 on 15/10/10.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTService : NSObject
@property(nonatomic,copy) NSString *icon_url;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *show_title;
@property(nonatomic,copy) NSString *click_link;
@property(nonatomic,copy) NSString *dot_text;
@property(nonatomic,assign)NSInteger sort;

+(instancetype) serviceWithDict:(NSDictionary *)dict;
@end
