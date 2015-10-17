//
//  PTNavigationController.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/7.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTNavigationController.h"
#import "PTLifeViewController.h"
#import "PTCategoryViewController.h"
#import "PTMeViewController.h"
#import "UIImage+Extension.h"

@interface PTNavigationController ()

@end

@implementation PTNavigationController

/** 设置navigationbar主题样式*/
+(void)initialize{
    [super initialize];
    
    //设置背景
    UINavigationBar *bar = [UINavigationBar appearance];
    [bar setBackgroundImage:[UIImage imageNamed:@"navbg"] forBarMetrics:UIBarMetricsDefault];
    
    //设置文字
    [bar setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }];
    
    //设置不透明
    bar.translucent = NO;
    
    //设置所有导航按钮文字样式
    UIBarButtonItem* btn = [UIBarButtonItem appearance];
    [btn setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : [UIFont systemFontOfSize:14] } forState:UIControlStateNormal];
//    btn.image=[btn.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
//    NSLog(@"%s %@",__func__,viewController);

    if ([viewController isKindOfClass:[PTCategoryViewController class]]) {
        return;
    }
    
    //自定义返回按钮
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc] initWithImage:[UIImage originImage:@"putao_icon_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
    UIBarButtonItem *fixItem=[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    fixItem.width=-15;

    viewController.navigationItem.leftBarButtonItems=@[fixItem,backItem];
    
    self.navigationController.interactivePopGestureRecognizer.delegate=(id)self;
}

- (void)backClick{
    [self popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
