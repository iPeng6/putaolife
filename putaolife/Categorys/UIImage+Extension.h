//
//  UIImage+Extension.h
//  备课-网易彩票
//
//  Created by js on 15/2/13.
//  Copyright (c) 2015年 czbk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**总是以原始图片呈现去除系统蒙版*/
+ (instancetype)originImage:(NSString *)imgName;

/**瓦片式拉伸图片*/
+ (instancetype)resizeImage:(NSString *)imgName;

@end


@implementation UIImage (Extension)

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