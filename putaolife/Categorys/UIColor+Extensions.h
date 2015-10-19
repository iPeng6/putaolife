//
//  UIColor+Extensions.h
//
//  Created by 玉良彭 on 15/8/31.
//  Copyright (c) 2015年 pengyl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extensions)

/** 获取随机颜色*/
+(instancetype) randomColor;

/** 获取十六进制颜色*/
+(instancetype) hexColor:(NSString *) hexStr;
@end

@implementation UIColor (Extensions)

+(instancetype) randomColor{
    
    CGFloat r= arc4random()%256/255.0f;
    CGFloat g= arc4random()%256/255.0f;
    CGFloat b= arc4random()%256/255.0f;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

+(instancetype) hexColor:(NSString *) hexStr {
    NSString *cString = [[hexStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
@end