//
//  DeleteCellView.h
//  SimpleApp
//
//  Created by codingzhe on 2020/3/25.
//  Copyright © 2020 codingzhe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 点击出现删除Cell确认浮层
@interface DeleteCellView : UIView

/// 点击出现删除Cell确认浮层
/// @param point 点击的位置
/// @param clickBlock 点击后的操作
- (void)showDeleteViewFromPoint:(CGPoint) point clickBlock:(dispatch_block_t)clickBlock;
@end

NS_ASSUME_NONNULL_END
