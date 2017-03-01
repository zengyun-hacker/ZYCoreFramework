//
//  NSString+ZYCore.h
//  Pods
//
//  Created by dreamer on 15/4/19.
//
//

#import <Foundation/Foundation.h>

@interface NSString (ZYCore)

- (BOOL)isEmpty;

- (NSString *)trim;

- (NSNumber *)toNumber;

- (BOOL)validateWithRegularString:(NSString *)regularString;

@end
