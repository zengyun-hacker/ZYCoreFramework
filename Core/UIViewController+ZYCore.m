//
//  UIViewController+ZYCore.m
//  Pods
//
//  Created by dreamer on 15/4/11.
//
//

#import "UIViewController+ZYCore.h"

@implementation UIViewController (ZYCore)

- (void)pushToViewControllerWithStoryboardName:(NSString *)storyboardName viewController:(NSString *)controllerIdentifer {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:controllerIdentifer];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)presentViewControllerWithStoryboardName:(NSString *)storyboardName viewController:(NSString *)controllerIdentifer animation:(BOOL)animation completion:(void (^)(void))completion {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:controllerIdentifer];
    [self presentViewController:viewController animated:animation completion:completion];
}

+ (UIViewController *)viewControllerWithIdentifer:(NSString *)identifier withStoryboardName:(NSString *)storyboardName {
    if (!storyboardName) {
        storyboardName = @"Main";
    }
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    return viewController;
}

@end
