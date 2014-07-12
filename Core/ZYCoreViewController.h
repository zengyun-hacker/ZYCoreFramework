//
//  ZYCoreViewController.h
//  ZYCoreFramework
//
//  Created by dreamer on 14-7-2.
//  Copyright (c) 2014年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kleftBarItem,
    kRightBarItem,
} BarItemType;

@interface ZYCoreViewController : UIViewController

- (void)setLeftBarItemWithImage:(NSString *)imageName target:(id)target action:(SEL)selector;

- (void)setLeftBarItemWithImage:(NSString *)imageName withHighLightedImageName:(NSString *)highLightedImage target:(id)target action:(SEL)selector;

- (void)setRightBarItemWithImage:(NSString *)imageName target:(id)target action:(SEL)selector;

- (void)setRightBarItemWithImage:(NSString *)imageName withHighLightedImageName:(NSString *)highLightedImage target:(id)target action:(SEL)selector;

- (void)setBarItemWithImage:(NSString *)normalImage withHighLightedImageName:(NSString *)highLightedImage target:(id)target action:(SEL)selector itemType:(BarItemType)type;

@end
