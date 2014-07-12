//
//  ZYConfig.h
//  ZYCoreFramework
//
//  Created by dreamer on 14-7-10.
//  Copyright (c) 2014年 SnowWolf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSString * const CONFIG_IMAGE_NAME_LEFT_BACK_ITEM = @"";
static BOOL const CONFIG_ANIMATION_POP = YES;
static CGFloat const FONT_BAR_ITEM = 12;

@interface ZYConfig : NSObject

#pragma mark - Color
+ (UIColor *)COLOR_BAR_ITEM_TEXT;

#pragma mark - Font
+ (UIFont *)FONT_BAR_ITEM_TEXT;

@end
