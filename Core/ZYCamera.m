//
//  ZYCamera.m
//  Pods
//
//  Created by dreamer on 16/3/25.
//
//

#import "ZYCamera.h"

@interface ZYCamera ()

@end

@implementation ZYCamera

- (BOOL)startCameraFromViewController:(UIViewController *)controller allowEditing:(BOOL)allowEditing {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        return NO;
    }

    UIImagePickerController *cameraUI = [UIImagePickerController new];
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    cameraUI.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];

    cameraUI.allowsEditing = allowEditing;
    cameraUI.delegate = self;

    [controller presentViewController:cameraUI animated:YES completion:nil];
    return YES;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *, id> *)info {
    NSString *mediaType = (NSString *) [info objectForKey:UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
//    if (CFStringCompare((__bridge CFStringRef)mediaType, kUTTypeImage, 0) == kCFCompareEqualTo) {
    editedImage = (UIImage *) info[UIImagePickerControllerEditedImage];
    originalImage = (UIImage *) info[UIImagePickerControllerOriginalImage];
    if (editedImage) {
        imageToSave = editedImage;
    }
    else {
        imageToSave = originalImage;
    }
    UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil);
    [picker dismissViewControllerAnimated:YES completion:nil];
    if (self.delegate) {
        [self.delegate didFinishTakingPhoto:imageToSave];
    }
//    }

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}


@end
