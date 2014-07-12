//
//  ViewController.m
//  ZYCoreFramework
//
//  Created by dreamer on 14-7-2.
//  Copyright (c) 2014年 SnowWolf. All rights reserved.
//

#import "ViewController.h"
#import "ZYCoreNavigationController.h"

@interface ViewController ()
            

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(UIButton *)sender {
    ViewController *newViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];
    newViewController.label.text = @"B";
    
    [(ZYCoreNavigationController *)self.navigationController pushViewController:newViewController animated:YES withDirection:kVertical];
}

- (void)back {
    ZYCoreNavigationController *navigationController = (ZYCoreNavigationController *)self.navigationController;
    [navigationController popViewController:YES withDirection:kVertical];
}

@end
