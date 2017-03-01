//
//  ZYCoreWebViewController.m
//  ZYCoreFramework
//
//  Created by dreamer on 14-7-13.
//  Copyright (c) 2014年 SnowWolf. All rights reserved.
//

#import "ZYCoreWebViewController.h"
#import "ZYConfig.h"

@interface ZYCoreWebViewController ()

@end

@implementation ZYCoreWebViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addWebView {
    self.webView = [[UIWebView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.webView];
    if (self.targetUrl && self.targetUrl.length > 0) {
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.targetUrl]]];
    }
}

- (void)back {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    }
    else {
        [self.navigationController popToRootViewControllerAnimated:CONFIG_ANIMATION_POP];
    }
}

@end
