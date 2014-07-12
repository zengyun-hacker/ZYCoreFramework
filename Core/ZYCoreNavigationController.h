//
//  ZYCoreNavigationController.h
//  ZYCoreFramework
//
//  Created by dreamer on 14-7-2.
//  Copyright (c) 2014年 SnowWolf. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kHorizontal,
    kVertical,
} PushDirection;

@interface ZYCoreNavigationController : UINavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated withDirection: (PushDirection)direction;

- (void)popViewController:(BOOL)animated withDirection:(PushDirection)direction;

@end
