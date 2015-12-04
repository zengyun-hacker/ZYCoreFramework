//
//  UIViewController+navigationBarItem.h
//  ZYCoreFramework
//
//  Created by Xiao Du on 15/1/29.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kleftBarItem,
    kRightBarItem,
} BarItemType;

@interface UIViewController (navigationBarItem)

- (void)setLeftBackItem;

- (void)setLeftBarItemWithImage:(NSString *)imageName target:(id)target action:(SEL)selector;

- (void)setLeftBarItemWithImage:(NSString *)imageName withHighLightedImageName:(NSString *)highLightedImage target:(id)target action:(SEL)selector;

- (void)setRightBarItemWithImage:(NSString *)imageName target:(id)target action:(SEL)selector;

- (void)setRightBarItemWithImage:(NSString *)imageName withHighLightedImageName:(NSString *)highLightedImage target:(id)target action:(SEL)selector;

- (void)setBarItemWithImage:(NSString *)normalImage withHighLightedImageName:(NSString *)highLightedImage target:(id)target action:(SEL)selector itemType:(BarItemType)type;

- (void)setLeftBarItemWithString:(NSString *)itemName target:(id)target action:(SEL)selector;

- (void)setRightBarItemWithString:(NSString *)itemName target:(id)target action:(SEL)selector;

- (void)setBarItemWithString:(NSString *)itemName target:(id)target action:(SEL)selector itemType:(BarItemType)type;

- (void)setTitleWithImage:(NSString *)imageName;

- (void)back;

@end
