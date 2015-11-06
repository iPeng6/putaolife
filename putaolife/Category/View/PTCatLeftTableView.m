//
//  PTCatLeftTableView.m
//  putaolife
//
//  Created by 彭玉良 on 15/11/4.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTCatLeftTableView.h"
#import "PTNav.h"
#import "PTCatLeftCell.h"

@interface PTCatLeftTableView()<UITableViewDataSource,UITableViewDelegate>

@end
@implementation PTCatLeftTableView

-(void)setNavis:(NSArray *)navis{
    _navis = navis;

    [self reloadData];
    
    // 默认选择第一项
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
}


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        
        // 初始化
        self.dataSource = self;
        self.delegate = self;
        
        self.rowHeight = 41;
        
        // 边框分割线
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [[UIColor alloc] initWithWhite:0.95 alpha:1.0f].CGColor;
        
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.navis.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PTCatLeftCell *cell = [PTCatLeftCell cell:tableView];
    cell.nav = self.navis[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PTCatLeftCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = RGB(100, 160, 140);
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    PTCatLeftCell *cell = [tableView cellForRowAtIndexPath:indexPath];
     cell.textLabel.textColor = [UIColor darkGrayColor];
}

@end
