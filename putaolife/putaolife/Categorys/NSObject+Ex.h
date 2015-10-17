//
//  NSObject+Ex.h
//
//  Created by 玉良彭 on 15/9/24.
//  Copyright (c) 2015年 pengyl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Ex)
/** 获取对象所有的属性名称*/
@property(nonatomic,readonly,strong) NSArray *propertys;

/** 判断对象是否包含某属性*/
-(BOOL) containPropertyNamed:(NSString *)name;

@end

@implementation NSObject (Ex)

-(BOOL)containPropertyNamed:(NSString *)name{
    unsigned count;
    objc_property_t *oper= class_copyPropertyList([self class], &count);
    
    for (int i=0; i<count; ++i) {
        NSString *proName =  [NSString stringWithUTF8String:property_getName(oper[i])];
        if ([proName isEqualToString:name]) {
            return YES;
        }
    }
    return NO;
}

-(NSArray *)propertys{

    NSMutableArray *arrayM=[NSMutableArray array];
    
    unsigned count;
    objc_property_t *oper= class_copyPropertyList([self class], &count);
    
    for (int i=0; i<count; ++i) {
        NSString *proName =  [NSString stringWithUTF8String:property_getName(oper[i])];
        [arrayM addObject:proName];
    }
    return arrayM;
}

@end
