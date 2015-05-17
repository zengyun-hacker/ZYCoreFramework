//
//  UIViewController+ZYCore.h
//  Pods
//
//  Created by dreamer on 15/4/11.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (ZYCore)

- (void)pushToViewControllerWithStoryboardName:(NSString *)storyboardName viewController:(NSString *)controllerIdentifer;

- (void)presentViewControllerWithStoryboardName:(NSString *)storyboardName viewController:(NSString *)controllerIdentifer animation:(BOOL)animation completion:(void (^)(void))completion;

+ (UIViewController *)viewControllerWithIdentifer:(NSString *)identifier withStoryboardName:(NSString *)storyboardName;


@end
