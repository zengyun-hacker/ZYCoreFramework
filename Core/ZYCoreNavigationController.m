//
//  ZYCoreNavigationController.m
//  ZYCoreFramework
//
//  Created by dreamer on 14-7-2.
//  Copyright (c) 2014年 SnowWolf. All rights reserved.
//

#import "ZYCoreNavigationController.h"
#import "UIView+ZYCore.h"
#import "ZYConfig.h"
#import "ZYCoreViewController.h"

static CGFloat const ANIMATION_DURATION = 0.4;

@interface ZYCoreNavigationController ()

@end

@implementation ZYCoreNavigationController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated withDirection: (PushDirection)direction {
    if (NO == animated) {
        [self pushViewController:viewController animated:NO];
        return;
    }
    if (kHorizontal == direction) {
        [self pushViewController:viewController animated:YES];
    }
    else if (kVertical == direction) {
        ZYCoreViewController *currentViewController = (ZYCoreViewController *)self.viewControllers.lastObject;
        UIView *maskView = viewController.view;
        maskView.top = currentViewController.view.height;
        [currentViewController.view addSubview:maskView];
        [UIView animateWithDuration:ANIMATION_DURATION animations:^{
            maskView.top = currentViewController.view.top;
        } completion:^(BOOL finished) {
            [maskView removeFromSuperview];
            [self pushViewController:viewController animated:NO];
        }];
    }
}

- (void)popViewController:(BOOL)animated withDirection:(PushDirection)direction {
    if (!animated) {
        [self popViewControllerAnimated:NO];
        return;
    }
    
    if (self.viewControllers.count < 2) {
        return;
    }
    if (kHorizontal == direction) {
        [self popViewControllerAnimated:YES];
    }
    else if (kVertical == direction) {
        ZYCoreViewController *currentViewController = self.viewControllers.lastObject;
        UIView *maskView = currentViewController.view;
        ZYCoreViewController *previousViewController = (ZYCoreViewController *)self.viewControllers[self.viewControllers.count - 2];
        [previousViewController.view addSubview:maskView];
        [self popViewControllerAnimated:NO];
        [UIView animateWithDuration:ANIMATION_DURATION animations:^{
            maskView.top = previousViewController.view.height;
        } completion:^(BOOL finished) {
            [maskView removeFromSuperview];
        }];
    }
}

@end
