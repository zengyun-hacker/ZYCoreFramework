//
//  ZYCoreNavigationController.m
//  ZYCoreFramework
//
//  Created by dreamer on 14-7-2.
//  Copyright (c) 2014年 SnowWolf. All rights reserved.
//

#import "ZYCoreNavigationController.h"
#import "UIView+ZYCore.h"
#import "ZYCoreConfig.h"

typedef enum {
    kleftBarItem,
    kRightBarItem,
} BarItemType;

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

- (void)setLeftBackItem {
    if (self.viewControllers.count > 1) {
        //如果可以返回的话，愉快地设置好返回按钮
        
    }
}

#pragma mark - Bar Item
- (void)setLeftBarItemWithImage:(NSString *)imageName {
    [self setLeftBarItemWithImage:imageName withHighLightedImageName:nil];
}

- (void)setLeftBarItemWithImage:(NSString *)imageName withHighLightedImageName:(NSString *)highLightedImage {
    [self setBarItemWithImage:imageName withHighLightedImageName:highLightedImage itemType:kleftBarItem];
}

- (void)setRightBarItemWithImage:(NSString *)imageName {
    [self setRightBarItemWithImage:imageName withHighLightedImageName:nil];
}

- (void)setRightBarItemWithImage:(NSString *)imageName withHighLightedImageName:(NSString *)highLightedImage {
    [self setBarItemWithImage:imageName withHighLightedImageName:highLightedImage itemType:kRightBarItem];
}

- (void)setBarItemWithImage:(NSString *)normalImage withHighLightedImageName:(NSString *)highLightedImage target:(id)target action:(SEL)selector itemType:(BarItemType)type{
    UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *buttonImage = [UIImage imageNamed:normalImage];
    [itemButton setImage:buttonImage forState:UIControlStateNormal];
    if (highLightedImage) {
        [itemButton setImage:[UIImage imageNamed:highLightedImage] forState:UIControlStateHighlighted];
    }
    itemButton.size = buttonImage.size;
    if ([target respondsToSelector:selector]) {
        [itemButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    }
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:itemButton];
    if (kleftBarItem == type) {
        self.navigationItem.leftBarButtonItem = barItem;
    }
    if (kRightBarItem == type) {
        self.navigationItem.rightBarButtonItem = barItem;
    }
}

#pragma mark - Action
- (void)back {
    if (self.viewControllers.count > 0) {
        [self popViewControllerAnimated:CONFIG_ANIMATION_POP];
    }
}

@end
