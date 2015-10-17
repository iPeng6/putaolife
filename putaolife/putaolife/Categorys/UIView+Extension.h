//
//  UIView+Extension.h
//  直接存取UIVIew对象的坐标大小
//
//  Created by js on 15/2/13.
//  Copyright (c) 2015年 czbk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat positionX;
@property (nonatomic, assign) CGFloat positionY;
@property (nonatomic, assign) CGFloat sizeW;
@property (nonatomic, assign) CGFloat sizeH;
@end


@implementation UIView(Extension)

- (CGFloat)positionX{
    return self.frame.origin.x;
}
- (CGFloat)positionY{
    return self.frame.origin.y;
}
- (CGFloat)sizeW{
    return self.frame.size.width;
}
- (CGFloat)sizeH{
    return self.frame.size.height;
}
- (void)setPositionX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (void)setPositionY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)setSizeW:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)setSizeH:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

@end