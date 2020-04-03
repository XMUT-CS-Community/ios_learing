//
//  NormalTableViewCell.h
//  SimpleApp
//
//  Created by codingzhe on 2020/3/24.
//  Copyright © 2020 codingzhe. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class ListItem;
//实现一个delegate 使得在使用view点击时 viewController能进行一些操作 点击删除按钮
@protocol NormalTableViewCellDelegate <NSObject>
// 点击的是哪个cell 点击s的是哪个button
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;
@end
//新闻列表cell
@interface NormalTableViewCell : UITableViewCell
//自己实现delegate
@property(nonatomic, weak, readwrite) id<NormalTableViewCellDelegate> delegate;

- (void) layoutTableViewCellWithItem:(ListItem *)item;

@end

NS_ASSUME_NONNULL_END
