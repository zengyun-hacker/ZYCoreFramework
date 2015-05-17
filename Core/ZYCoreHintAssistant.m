//
//  ZYCoreHintAssistant.m
//  Pods
//
//  Created by dreamer on 15/4/11.
//
//

#import "ZYCoreHintAssistant.h"
#import <UIKit/UIKit.h>

static NSInteger const TAG_INDICATOR = 30000;

@implementation ZYCoreHintAssistant

+ (void)showAlertViewWithTitle:(NSString *)title {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:nil delegate:nil cancelButtonTitle:@"好" otherButtonTitles:nil, nil];
    [alertView show];
}

+ (void)showLoading {
    if ([[UIApplication sharedApplication].keyWindow viewWithTag:TAG_INDICATOR]) {
        return;
    }
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.tag = TAG_INDICATOR;
    [indicator startAnimating];
    [[UIApplication sharedApplication].keyWindow addSubview:indicator];
}

+ (void)hideLoading {
    
}

@end
