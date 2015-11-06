//
//  UIView+Extension.h
//  直接存取UIVIew对象的坐标大小
//
//  Created by js on 15/2/13.
//  Copyright (c) 2015年 czbk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Ex)

@property (nonatomic, assign) CGFloat positionX;
@property (nonatomic, assign) CGFloat positionY;
@property (nonatomic, assign) CGFloat sizeW;
@property (nonatomic, assign) CGFloat sizeH;

@end