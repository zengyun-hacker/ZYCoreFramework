//
//  NSString+ZYCore.m
//  Pods
//
//  Created by dreamer on 15/4/19.
//
//

#import "NSString+ZYCore.h"

@implementation NSString (ZYCore)

- (BOOL)isEmpty {
	if (!self || self.length == 0) {
		return YES;
	}
	return NO;
}

- (NSString *)trim {
	return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSNumber *)toNumber {
	NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
	numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
	return [numberFormatter numberFromString:self];
}

@end
