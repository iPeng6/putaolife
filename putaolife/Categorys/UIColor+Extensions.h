//
//  UIColor+Extensions.h
//
//  Created by 玉良彭 on 15/8/31.
//  Copyright (c) 2015年 pengyl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extensions)

/**获取随机颜色*/
+(instancetype) randomColor;

@end

@implementation UIColor (Extensions)

+(instancetype) randomColor{
    
    CGFloat r= arc4random()%256/255.0f;
    CGFloat g= arc4random()%256/255.0f;
    CGFloat b= arc4random()%256/255.0f;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}
@end