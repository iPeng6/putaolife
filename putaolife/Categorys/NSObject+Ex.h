//
//  NSObject+Ex.h
//
//  Created by 玉良彭 on 15/9/24.
//  Copyright (c) 2015年 pengyl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Ex)
/** 获取对象所有的属性名称*/
@property(nonatomic,readonly,strong) NSArray *propertys;

/** 判断对象是否包含某属性*/
-(BOOL) containPropertyNamed:(NSString *)name;

@end

