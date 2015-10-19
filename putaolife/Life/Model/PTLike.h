//
//  PTLike.h
//  putaolife
//
//  Created by 玉良彭 on 15/10/17.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTLike : NSObject
@property(nonatomic,copy) NSString *small_icon_url;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *desc;
@property(nonatomic,copy) NSString *click_link;
@property(nonatomic,copy) NSString *show_title;
@property(nonatomic,assign)NSInteger sort;

+(instancetype)likeWithDict:(NSDictionary *)dict;
@end
