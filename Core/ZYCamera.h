//
//  ZYCamera.h
//  Pods
//
//  Created by dreamer on 16/3/25.
//
//

#import <Foundation/Foundation.h>

@protocol ZYCameraDelegate

@optional
- (void)didFinishTakingPhoto:(UIImage *)image;

@end

/**
 *  打开照相
 */
@interface ZYCamera : NSObject <UIImagePickerControllerDelegate>

@property(nonatomic, weak) id <ZYCameraDelegate> delegate;

- (BOOL)startCameraFromViewController:(UIViewController *)controller allowEditing:(BOOL)allowEditing;

@end
