//
//  PTBaseTableCell.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/10.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTBaseTableCell.h"

@implementation PTBaseTableCell

//去除系统的分割线，自定义绘制表格下边框横线
-(void)drawRect:(CGRect)rect{
    CGContextRef ctx=UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 0, CGRectGetMaxY(rect));
    CGContextAddLineToPoint(ctx, CGRectGetMaxX(rect), CGRectGetMaxY(rect));
    [RGB(233, 233, 233) setStroke];
    CGContextStrokePath(ctx);
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //初始化单元格 字体、颜色、选中样式
        self.textLabel.font=[UIFont systemFontOfSize:15];
        self.textLabel.textColor=RGB(103, 103, 103);
        self.selectionStyle=UITableViewCellSelectionStyleNone;
    }
    return self;
}
@end
