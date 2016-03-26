//
// Created by dreamer on 16/3/26.
//

#import "ZYPhotoPicker.h"


@implementation ZYPhotoPicker

- (BOOL)startMediaBrowserFromeViewController:(UIViewController *)viewController allowsEditing:(BOOL)allowsEditing {
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum] || !viewController) {
        return NO;
    }

    UIImagePickerController *mediaUI = [UIImagePickerController new];
    mediaUI.delegate = self;
    mediaUI.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;

    mediaUI.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    mediaUI.allowsEditing = allowsEditing;

    [viewController presentViewController:mediaUI animated:YES completion:nil];

    return YES;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *, id> *)info {
    NSString *mediaType = (NSString *) info[UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToUse;

//    if (CFStringCompare((__bridge CFStringRef)mediaType, kUTTypeImage, 0) == kCFCompareEqualTo) {
    originalImage = (UIImage *) info[UIImagePickerControllerOriginalImage];
    editedImage = (UIImage *) info[UIImagePickerControllerEditedImage];

    if (editedImage) {
        imageToUse = editedImage;
    }
    else {
        imageToUse = originalImage;
    }

    [picker dismissViewControllerAnimated:YES completion:nil];
    if (self.delegate) {
        [self.delegate didFinishPickingPhoto:imageToUse];
    }
//    }

}


@end