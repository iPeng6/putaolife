//
//  PTTabBarController.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/7.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTTabBarController.h"


@interface PTTabBarController ()

@end

@implementation PTTabBarController

/** 设置tabbar主题样式*/
+(void)initialize{
    [super initialize];
    
    //设置选中文字样式
    UITabBarItem *item =[UITabBarItem appearance];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:RGB(40,161,110)} forState:UIControlStateSelected];
    
    //设置非选中文字样式
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:RGB(104,104,104)}  forState:UIControlStateDisabled];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

@end
