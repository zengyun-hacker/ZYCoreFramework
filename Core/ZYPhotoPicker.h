//
// Created by dreamer on 16/3/26.
//

#import <Foundation/Foundation.h>

@protocol ZYPhotoPickerDelegate

@optional
- (void)didFinishPickingPhoto:(UIImage *)image;

@end

@interface ZYPhotoPicker : NSObject <UIImagePickerControllerDelegate>

@property (nonatomic, weak) id <ZYPhotoPickerDelegate> delegate;

- (BOOL)startMediaBrowserFromeViewController:(UIViewController *)viewController allowsEditing:(BOOL)allowsEditing;
@end