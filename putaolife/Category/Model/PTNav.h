//
//  PTNav.h
//  putaolife
//
//  Created by 彭玉良 on 15/11/4.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTNav : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSArray *fun_views;
@property(nonatomic,assign) NSInteger sort;

+(instancetype) navWithDict:(NSDictionary *)dict;
@end
