//
//  UILabel+ZYCore.m
//  ZYCoreFramework
//
//  Created by dreamer on 14-7-12.
//  Copyright (c) 2014年 SnowWolf. All rights reserved.
//

#import "UILabel+ZYCore.h"
#import "UIView+ZYCore.h"

@implementation UILabel (ZYCore)

- (CGFloat)labelAdjustHeight {
    CGFloat labelHeight = 0;
    if ([self.text respondsToSelector:@selector(boundingRectWithSize:options:attributes:context:)]) {
        NSDictionary *attribute = @{NSFontAttributeName: self.font};
        CGSize stringSize = [self.text boundingRectWithSize:CGSizeMake(self.width , MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine attributes:attribute context:nil].size;
        labelHeight = stringSize.height;
    }
    else {
        CGSize stringSize = [self.text sizeWithFont:self.font forWidth:self.width lineBreakMode:NSLineBreakByWordWrapping];
        labelHeight = stringSize.height;
    }
    return labelHeight;
}

- (void)setAdjustToMaxLine:(NSInteger)maxLine {
    CGFloat labelHeight = [self labelAdjustHeight];
    CGFloat oldWidth = self.width;
    self.numberOfLines = 0;
    [self sizeToFit];
    if (self.height > labelHeight) {
        self.height = labelHeight;
    }
    self.width = oldWidth;
}

@end
