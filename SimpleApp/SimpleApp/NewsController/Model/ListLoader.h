//
//  ListLoader.h
//  SimpleApp
//
//  Created by codingzhe on 2020/3/26.
//  Copyright © 2020 codingzhe. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ListItem;
NS_ASSUME_NONNULL_BEGIN

typedef void(^ListLoaderFinishBlock)(BOOL success, NSArray<ListItem *> *dataArray);


/// 列表请求
@interface ListLoader : NSObject
- (void)loadListDataWithFinishBlock:(ListLoaderFinishBlock)finishBlock;
@end

NS_ASSUME_NONNULL_END
