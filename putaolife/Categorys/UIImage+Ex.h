//
//  UIImage+Extension.h
//  备课-网易彩票
//
//  Created by js on 15/2/13.
//  Copyright (c) 2015年 czbk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Ex)

/** 总是以原始图片呈现去除系统蒙版*/
+ (instancetype)originImage:(NSString *)imgName;

/** 瓦片式拉伸图片*/
+ (instancetype)resizeImage:(NSString *)imgName;

@end