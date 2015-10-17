//
//  PTWebViewController.h
//  putaolife
//
//  Created by 玉良彭 on 15/10/10.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PTWebViewController : UIViewController
@property(nonatomic,copy) NSString *urlStr;

-(instancetype)initWithUrlStr:(NSString *)urlStr title:(NSString *)title;

@end
