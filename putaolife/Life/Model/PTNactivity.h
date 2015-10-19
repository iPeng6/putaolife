//
//  PTNactivity.h
//  putaolife
//
//  Created by 玉良彭 on 15/10/18.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTNactivity : NSObject
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *subtitle;
@property(nonatomic,copy) NSString *title_color;
@property(nonatomic,copy) NSString *image_url;
@property(nonatomic,copy) NSString *click_link;
@property(nonatomic,copy) NSString *show_title;
@property(nonatomic,assign)NSInteger sort;

+(instancetype) nactivityWithDict:(NSDictionary *)dict;
@end
