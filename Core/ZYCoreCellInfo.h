//
//  ZYCoreCellInfo.h
//  Pods
//
//  Created by dreamer on 15/9/27.
//
//

#import <Foundation/Foundation.h>
#import "ZYBlockDefine.h"

@class ZYCoreTableViewCell;

typedef void(^ZYTableViewCallBack)(UITableView *tableView, ZYCoreTableViewCell *cell, NSIndexPath *indexPath, id cellData);

@interface ZYCoreCellInfo : NSObject

@property (nonatomic) id cellData;
@property (nonatomic) CGFloat cellHeight;
@property (nonatomic) Class cellClass;
@property (nonatomic) NSString *reuseIdentifier;
@property (nonatomic) UITableViewCellAccessoryType accessoryType;

@property (nonatomic, copy) ZYTableViewCallBack cellDidSelected;
@property (nonatomic, copy) ZYTableViewCallBack cellDidReuse;
@property (nonatomic, copy) ZYTableViewCallBack cellWillDisplay;

- (instancetype)initWithCellClass:(Class)cellClass;

- (instancetype)initWithCellClass:(Class)cellClass withCellHeight:(CGFloat)cellHeight withDidSelectedCallBack:(ZYTableViewCallBack)cellDidSelectd;

- (instancetype)initWithCellClass:(Class)cellClass withCellHeight:(CGFloat)cellHeight withCellData:(id)data withDidSelectedCallBack:(ZYTableViewCallBack)cellDidSelectd;

@end
