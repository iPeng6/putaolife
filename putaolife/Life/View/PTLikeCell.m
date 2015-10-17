//
//  PTLikeCell.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/17.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTLikeCell.h"
#import "PTLikeChildView.h"

@interface PTLikeCell()

@end
@implementation PTLikeCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //初始化
        CGFloat w = kScreenW/3.0;
        PTLikeChildView *view1 = [[PTLikeChildView alloc] initWithFrame:CGRectMake(0, 0, w, 100)];
 
        PTLikeChildView *view2 = [[PTLikeChildView alloc] initWithFrame:CGRectMake(w, 0, w, 100)];

        PTLikeChildView *view3 = [[PTLikeChildView alloc] initWithFrame:CGRectMake(w*2, 0, w, 100)];
        
        [self.contentView addSubview:view1];
        [self.contentView addSubview:view2];
        [self.contentView addSubview:view3];
    }
    return self;
}

-(void)setGuessNeeds:(NSArray *)guessNeeds{
    _guessNeeds = guessNeeds;
    
    [self.guessNeeds enumerateObjectsUsingBlock:^(PTLike *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        PTLikeChildView *view = self.contentView.subviews[idx];
        view.like = obj;
    }];
    
    
}
@end
