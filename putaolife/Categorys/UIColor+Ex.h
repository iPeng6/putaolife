//
//  UIColor+Extensions.h
//
//  Created by 玉良彭 on 15/8/31.
//  Copyright (c) 2015年 pengyl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Ex)

/** 获取随机颜色*/
+(instancetype) randomColor;

/** 获取十六进制颜色*/
+(instancetype) hexColor:(NSString *) hexStr;
@end

