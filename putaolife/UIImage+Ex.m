//
//  UIImage+Ex.m
//  putaolife
//
//  Created by 彭玉良 on 15/11/4.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "UIImage+Ex.h"

@implementation UIImage (Ex)

+ (instancetype)originImage:(NSString *)imgName{
    UIImage *img = [self imageNamed:imgName];
    return [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

+ (instancetype)resizeImage:(NSString *)imgName{
    UIImage *img = [UIImage imageNamed:imgName];
    img = [img stretchableImageWithLeftCapWidth:img.size.width * 0.5 topCapHeight:img.size.height * 0.5];
    return img;
}
@end