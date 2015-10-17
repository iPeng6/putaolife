//
//  PTServiceCell.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/10.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTServiceCell.h"
#import "UIView+Extension.h"
#import "PTServiceCollectionCell.h"

@interface PTServiceCell()<UICollectionViewDataSource>
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) UICollectionViewFlowLayout *layout;
@end
@implementation PTServiceCell

static NSString *const reuseId=@"collectionCell";

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.layout=[[UICollectionViewFlowLayout alloc] init];
        self.layout.itemSize=CGSizeMake(kScreenW/4.0-5, 85);
        self.layout.minimumInteritemSpacing=0;
        self.layout.minimumLineSpacing=0;
        self.layout.sectionInset=UIEdgeInsetsMake(10, 10, 10, 10);
        
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        [self.contentView addSubview:_collectionView];
        _collectionView.dataSource=self;
        _collectionView.backgroundColor=[UIColor whiteColor];
        
        //注册cell
        [_collectionView registerClass:[PTServiceCollectionCell class] forCellWithReuseIdentifier:reuseId];
    }
    return self;
}

-(void)setBaseServices:(NSArray *)baseServices{
    _baseServices=baseServices;

    self.collectionView.frame=CGRectMake(0, 0, self.sizeW,self.sizeH);
    [self.collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.baseServices.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    PTServiceCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:reuseId forIndexPath:indexPath];

    cell.service=self.baseServices[indexPath.row];
    return cell;
}
@end
