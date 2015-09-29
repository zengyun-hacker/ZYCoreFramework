//
//  ZYCoreCellInfo.m
//  Pods
//
//  Created by dreamer on 15/9/27.
//
//

#import "ZYCoreCellInfo.h"

@implementation ZYCoreCellInfo

- (instancetype)initWithCellClass:(Class)cellClass {
    return [self initWithCellClass:cellClass withCellHeight:0 withDidSelectedCallBack:nil];
}

- (instancetype)initWithCellClass:(Class)cellClass withCellHeight:(CGFloat)cellHeight withDidSelectedCallBack:(ZYTableViewCallBack)cellDidSelectd {
    self = [super init];
    if (self) {
        self.cellClass = cellClass;
        self.cellHeight = cellHeight;
        self.cellDidSelected = cellDidSelectd;
        self.reuseIdentifier = NSStringFromClass(cellClass);
    }
    return self;
}

@end
