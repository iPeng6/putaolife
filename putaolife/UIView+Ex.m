//
//  UIView+Ex.m
//  putaolife
//
//  Created by 彭玉良 on 15/11/4.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "UIView+Ex.h"

@implementation UIView(Ex)

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