//
//  ZYBlockDefine.h
//  ZYCoreFramework
//
//  Created by dreamer on 15/1/27.
//  Copyright (c) 2015年 SnowWolf. All rights reserved.
//

#ifndef ZYCoreFramework_ZYBlockDefine_h
#define ZYCoreFramework_ZYBlockDefine_h

typedef void(^ZYBlock)();
typedef void(^ZYObjectBlock)(id param);
typedef void(^ZYImageBlock)(UIImageView *imageView);
typedef void(^ZYDictionaryBlock)(NSDictionary *dic);
typedef void(^ZYBoolBlock)(BOOL boo);
typedef void(^ZYStringBlock)(NSString *string);

#endif
