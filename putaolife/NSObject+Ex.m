//
//  NSObject+Ex.m
//  putaolife
//
//  Created by 彭玉良 on 15/11/4.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "NSObject+Ex.h"
#import <objc/runtime.h>

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

- (NSString *) description{
    return [[self dictionaryWithValuesForKeys:self.propertys] descriptionWithLocale:[NSLocale localeWithLocaleIdentifier:@"zh-cn"]];
}
@end
