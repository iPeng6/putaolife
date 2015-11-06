//
//  PTCatRightCollectView.m
//  putaolife
//
//  Created by 彭玉良 on 15/11/5.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTCatRightCollectView.h"
#import "UIColor+Ex.h"
#import "PTNav.h"
#import "PTCatHeaderView.h"
#import "PTCatRightCell.h"

static NSString *const reuseCellId = @"reuseCellId";
static NSString *const reuseHeaderId = @"reuseHeaderId";
@interface PTCatRightCollectView()<UICollectionViewDataSource, UICollectionViewDelegate>

@end
@implementation PTCatRightCollectView

- (instancetype)init{
    
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    
    layout.itemSize = CGSizeMake(floor((kScreenW-70)/3.0), 110);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    
    layout.headerReferenceSize = CGSizeMake(0, 30);
    
    if (self = [super initWithFrame:CGRectZero collectionViewLayout:layout]) {
        
        self.dataSource = self;
        self.delegate = self;
        
        // 注册cell
        [self registerClass:[PTCatRightCell class] forCellWithReuseIdentifier:reuseCellId];
        [self registerClass:[PTCatHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseHeaderId];
        
        self.backgroundColor = [UIColor whiteColor];

        // 监听左侧选择的位置
        __weak typeof(self) _self = self;
        [[NSNotificationCenter defaultCenter] addObserverForName:PTCatLeftSelectChange object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
            NSIndexPath *idx = note.object;
    
            NSIndexPath *idxNew = [NSIndexPath indexPathForItem:0 inSection:idx.row];
            [_self scrollToItemAtIndexPath:idxNew atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
            
            // 矫正位置显示组视图
            [UIView animateWithDuration:0.25 animations:^{
                [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                
                CGPoint offset = _self.contentOffset;
                _self.contentOffset = CGPointMake(0, offset.y-30);
            }];
            
        }];
        
        
    }
    return self;
}

-(void)setNavis:(NSArray *)navis{
    _navis = navis;

    [self reloadData];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.navis.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    PTNav *nav = self.navis[section];
    return nav.fun_views.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PTCatRightCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseCellId forIndexPath:indexPath];
    PTNav *nav =  self.navis[indexPath.section];
    cell.funview = nav.fun_views[indexPath.row];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    PTCatHeaderView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:reuseHeaderId forIndexPath:indexPath];
    view.name = ((PTNav *)self.navis[indexPath.section]).name;

    return view;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (!self.isDragging) {
        return;
    }
    
    NSArray *paths = [self indexPathsForVisibleSupplementaryElementsOfKind:UICollectionElementKindSectionHeader];
    
    // 坑：默认居然没顺序
    paths = [paths sortedArrayUsingComparator:^NSComparisonResult(NSIndexPath *obj1, NSIndexPath *obj2) {
        return obj1.section > obj2.section;
    }];
    
    if (paths.count > 0) {
        // 通知接收者右侧滚动到的位置
        [[NSNotificationCenter defaultCenter] postNotificationName:PTCatRightSelectChange object:paths.firstObject];
    }
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
