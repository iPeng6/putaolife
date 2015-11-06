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
@property(nonatomic,strong) NSIndexPath *curIndex;
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
        
        // 监听右侧滚动的位置
        __weak typeof(self) _self = self;
        [[NSNotificationCenter defaultCenter] addObserverForName:PTCatRightSelectChange object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            // 去除之前颜色选择
            PTCatLeftCell *cellOld = [_self cellForRowAtIndexPath:_self.curIndex];
            cellOld.textLabel.textColor = [UIColor darkGrayColor];
            
            // 构建新的indexPath
            NSIndexPath *idx = note.object;
            NSIndexPath *idxNew = [NSIndexPath indexPathForItem:idx.section inSection:0];
            
            // 选择它触发选择背景图片的更换
            [_self selectRowAtIndexPath:idxNew animated:NO scrollPosition:UITableViewScrollPositionNone];
            
            // 设置选择样式为绿色
            PTCatLeftCell *cellNew = [_self cellForRowAtIndexPath:idxNew];
            cellNew.textLabel.textColor = RGB(100, 160, 140);
            
            _self.curIndex = idxNew;
        }];
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
    
    // 发送一个通知告诉接收者左侧表格选择了哪一项
    [[NSNotificationCenter defaultCenter] postNotificationName:PTCatLeftSelectChange object:indexPath];
    self.curIndex = indexPath;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    PTCatLeftCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor darkGrayColor];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
