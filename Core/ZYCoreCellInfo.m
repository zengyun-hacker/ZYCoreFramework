//
//  ZYCoreCellInfo.m
//  Pods
//
//  Created by dreamer on 15/9/27.
//
//

#import "ZYCoreCellInfo.h"

@implementation ZYCoreCellInfo

- (NSString *)reuseIdentifier {
    if (!_reuseIdentifier) {
        _reuseIdentifier = NSStringFromClass(self.cellClass);
    }
    return _reuseIdentifier;
}

- (instancetype)initWithCellClass:(Class)cellClass {
    return [self initWithCellClass:cellClass withCellHeight:0 withDidSelectedCallBack:nil];
}

- (instancetype)initWithCellClass:(Class)cellClass withCellHeight:(CGFloat)cellHeight withDidSelectedCallBack:(ZYTableViewCallBack)cellDidSelectd {
    return [self initWithCellClass:cellClass withCellHeight:cellHeight withCellData:nil withDidSelectedCallBack:cellDidSelectd];
}

- (instancetype)initWithCellClass:(Class)cellClass withCellHeight:(CGFloat)cellHeight withCellData:(id)data withDidSelectedCallBack:(ZYTableViewCallBack)cellDidSelectd {
    self = [super init];
    if (self) {
        self.cellClass = cellClass;
        self.cellHeight = cellHeight;
        self.cellDidSelected = cellDidSelectd;
        self.reuseIdentifier = NSStringFromClass(cellClass);
        self.cellData = data;
    }
    return self;
}

@end
