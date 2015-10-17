//
//  PTLifeHeadView.h
//  putaolife
//
//  Created by 玉良彭 on 15/10/10.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^PTLifeHeadViewClickBlock)(NSString *urlStr,NSString *title);

@interface PTLifeHeadView : UIView
@property(nonatomic,strong) NSArray *adActivitys;//广告活动
@property(nonatomic,copy) PTLifeHeadViewClickBlock clickBlock;

-(instancetype)initWithFrame:(CGRect)frame clickBlock:(PTLifeHeadViewClickBlock)clickBlock;
@end
