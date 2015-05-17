//
//  ZYCoreQRViewController.h
//  Pods
//
//  Created by Xiao Du on 15/5/17.
//
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

/**
 *  二维码扫码界面
 */
@interface ZYCoreQRViewController : UIViewController <AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic) BOOL shouldRead;

- (void)scanFinish:(NSString *)result;

@end
