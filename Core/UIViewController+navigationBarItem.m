//
//  UIViewController+navigationBarItem.m
//  ZYCoreFramework
//
//  Created by Xiao Du on 15/1/29.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import "UIViewController+navigationBarItem.h"
#import "UIView+ZYCore.h"
#import "ZYConfig.h"
#import "ZYCoreDefine.h"

@implementation UIViewController (navigationBarItem)

- (void)setLeftBackItem {
    if (self.navigationController.viewControllers.count > 1) {
        //如果可以返回的话，愉快地设置好返回按钮
        if (CONFIG_IMAGE_NAME_LEFT_BACK_ITEM && CONFIG_IMAGE_NAME_LEFT_BACK_ITEM.length > 0) {
            [self setLeftBarItemWithImage:CONFIG_IMAGE_NAME_LEFT_BACK_ITEM target:self action:@selector(back)];
        }
        else {
            [self setLeftBarItemWithString:@"返回" target:self action:@selector(back)];
        }
    }
}

#pragma mark - Bar Item
- (void)setLeftBarItemWithImage:(NSString *)imageName target:(id)target action:(SEL)selector {
    [self setLeftBarItemWithImage:imageName withHighLightedImageName:nil target:target action:selector];
}

- (void)setLeftBarItemWithImage:(NSString *)imageName withHighLightedImageName:(NSString *)highLightedImage target:(id)target action:(SEL)selector {
    [self setBarItemWithImage:imageName withHighLightedImageName:highLightedImage target:target action:selector itemType:kleftBarItem];
}

- (void)setRightBarItemWithImage:(NSString *)imageName target:(id)target action:(SEL)selector {
    [self setRightBarItemWithImage:imageName withHighLightedImageName:nil target:target action:selector];
}

- (void)setRightBarItemWithImage:(NSString *)imageName withHighLightedImageName:(NSString *)highLightedImage target:(id)target action:(SEL)selector {
    [self setBarItemWithImage:imageName withHighLightedImageName:highLightedImage target:target action:selector itemType:kRightBarItem];
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

- (void)setLeftBarItemWithString:(NSString *)itemName target:(id)target action:(SEL)selector {
    [self setBarItemWithString:itemName target:target action:selector itemType:kleftBarItem];
}

- (void)setRightBarItemWithString:(NSString *)itemName target:(id)target action:(SEL)selector {
    [self setBarItemWithString:itemName target:target action:selector itemType:kRightBarItem];
}

- (void)setBarItemWithString:(NSString *)itemName target:(id)target action:(SEL)selector itemType:(BarItemType)type {
    UIButton *itemButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [itemButton setTitle:itemName forState:UIControlStateNormal];
    itemButton.titleLabel.font = [ZYConfig FONT_BAR_ITEM_TEXT];
    itemButton.titleLabel.textColor = [ZYConfig COLOR_BAR_ITEM_TEXT];
    [itemButton.titleLabel sizeToFit];
    itemButton.size = itemButton.titleLabel.size;
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
    [self.navigationController popViewControllerAnimated:CONFIG_ANIMATION_POP];
}

@end
