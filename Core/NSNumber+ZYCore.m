//
//  NSNumber+ZYCore.m
//  Pods
//
//  Created by dreamer on 15/5/23.
//
//

#import "NSNumber+ZYCore.h"

@implementation NSNumber (ZYCore)

- (NSString *)toDefaultDataString {
	NSDate *date = [NSDate dateWithTimeIntervalSinceNow:self.integerValue];
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	dateFormatter.dateStyle = kCFDateFormatterShortStyle;
	dateFormatter.dateStyle = kCFDateFormatterShortStyle;
	return [dateFormatter stringFromDate:date];
}

@end
