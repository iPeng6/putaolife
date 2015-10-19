//
//  PTNactivityCell.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/19.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTNactivityCell.h"
#import "PTNactivityCellLeftView.h"
#import "PTNactivityCellRightView.h"
#import <Masonry.h>

@interface PTNactivityCell()
@property(nonatomic,strong) PTNactivityCellLeftView *leftView;
@property(nonatomic,strong) PTNactivityCellRightView *rightTop;
@property(nonatomic,strong) PTNactivityCellRightView *rightBottom;

@end

@implementation PTNactivityCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //初始化
        PTNactivityCellLeftView *leftView = [PTNactivityCellLeftView new];
        PTNactivityCellRightView *rightTop = [PTNactivityCellRightView new];
        PTNactivityCellRightView *rightBottom = [PTNactivityCellRightView new];
        
        self.leftView = leftView;
        self.rightTop = rightTop;
        self.rightBottom = rightBottom;
        
        [self.contentView addSubview:leftView];
        [self.contentView addSubview:rightTop];
        [self.contentView addSubview:rightBottom];
        
        [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self.contentView);
            make.right.equalTo(self.contentView.mas_centerX).offset(1);
            make.bottom.equalTo(self.contentView);
        }];
        [rightTop mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView.mas_centerX);
            make.bottom.equalTo(self.contentView.mas_centerY);
        }];
        [rightBottom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.equalTo(self.contentView);
            make.left.equalTo(self.contentView.mas_centerX);
            make.top.equalTo(self.contentView.mas_centerY).offset(-1);
            
        }];
    }
    return self;
}

- (void)setNactivities:(NSArray *)nactivities{
    _nactivities = nactivities;
    
    if (nactivities.count == 3) {
        self.leftView.nactivity = nactivities[0];
        self.rightTop.nactivity = nactivities[1];
        self.rightBottom.nactivity = nactivities[2];
    }
}

@end
