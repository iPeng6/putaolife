//
//  AppDelegate.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/7.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "AppDelegate.h"
#import "PTTabBarController.h"
#import "PTNavigationController.h"
#import "PTLifeViewController.h"
#import "PTCategoryViewController.h"
#import "PTMeViewController.h"
#import "UIImage+Ex.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

/** 加载各根控制器*/
- (void) initRootVC{
    self.window=[[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    PTTabBarController *tabVC=[[PTTabBarController alloc] init];
    
    //生活
    PTLifeViewController *lifeVC=[PTLifeViewController new];
    lifeVC.view.backgroundColor=[UIColor whiteColor];
    PTNavigationController *lifeNavVC=[[PTNavigationController alloc] initWithRootViewController:lifeVC];
    lifeNavVC.tabBarItem.title=@"生活";
    lifeNavVC.tabBarItem.image=[UIImage originImage:@"putao_icon_tab_home_dis"];
    lifeNavVC.tabBarItem.selectedImage=[UIImage originImage:@"putao_icon_tab_home_usa"];
    
    
    //分类
    PTCategoryViewController *categoryVC=[PTCategoryViewController new];
    categoryVC.view.backgroundColor=[UIColor whiteColor];
    PTNavigationController *categoryVCNavVC=[[PTNavigationController alloc] initWithRootViewController:categoryVC];
    categoryVCNavVC.title=@"分类";
    categoryVCNavVC.tabBarItem.image=[UIImage originImage:@"putao_icon_tab_fenlei_dis"];
    categoryVCNavVC.tabBarItem.selectedImage=[UIImage originImage:@"putao_icon_tab_fenlei_usa"];
    
    //我
    PTMeViewController *meVC=[PTMeViewController new];
    meVC.view.backgroundColor=[UIColor whiteColor];
    PTNavigationController *meNavVC=[[PTNavigationController alloc] initWithRootViewController:meVC];
    meNavVC.title=@"我";
    meNavVC.tabBarItem.image=[UIImage originImage:@"putao_icon_tab_me_dis"];
    meNavVC.tabBarItem.selectedImage=[UIImage originImage:@"putao_icon_tab_me_usa"];
    
    tabVC.viewControllers=@[lifeNavVC,categoryVCNavVC,meNavVC];
 
    self.window.rootViewController=tabVC;
    [self.window makeKeyAndVisible];
}

/** 设置状态栏样式*/
- (void)setStatusBarStyle {
    [UIApplication sharedApplication].statusBarHidden=NO;
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initRootVC];
    [self setStatusBarStyle];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
