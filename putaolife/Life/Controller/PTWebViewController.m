//
//  PTWebViewController.m
//  putaolife
//
//  Created by 玉良彭 on 15/10/10.
//  Copyright © 2015年 pengyl. All rights reserved.
//

#import "PTWebViewController.h"

@interface PTWebViewController ()
@property(nonatomic,strong) UIWebView *webView;
@end

@implementation PTWebViewController

-(UIWebView *)webView{
    if (_webView==nil) {
        _webView=[[UIWebView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_webView];
    }
    return _webView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=NO;
    if (self.urlStr) {
        //加载网页
        NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
        [self.webView loadRequest:request];
    }
}

-(instancetype)initWithUrlStr:(NSString *)urlStr title:(NSString *)title{
    if (self=[super init]) {
        self.urlStr=urlStr;
        self.title=title;
        
        //隐藏底部tabbar
        self.hidesBottomBarWhenPushed=YES;
    }
    return self;
}
@end
