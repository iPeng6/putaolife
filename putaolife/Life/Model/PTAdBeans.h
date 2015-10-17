//
//  PTAdBeans.h
//  putaolife
//
//  Created by 玉良彭 on 15/10/9.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTAdBeans : NSObject
@property(nonatomic,copy) NSString *show_title;
@property(nonatomic,copy) NSString *image_url;
@property(nonatomic,copy) NSString *click_link;

+(instancetype) adBeansWithDict:(NSDictionary *)dict;
@end
