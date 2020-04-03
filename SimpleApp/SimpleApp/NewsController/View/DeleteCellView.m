//
//  DeleteCellView.m
//  SimpleApp
//
//  Created by codingzhe on 2020/3/25.
//  Copyright © 2020 codingzhe. All rights reserved.
//

#import "DeleteCellView.h"


@interface DeleteCellView()

@property(nonatomic, strong, readwrite) UIView *backgroundView;
@property(nonatomic, strong, readwrite) UIButton *deleteButton;
@property(nonatomic, copy, readwrite) dispatch_block_t deleteBlock;

@end

@implementation DeleteCellView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:({
            _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
            _backgroundView.backgroundColor = [UIColor blackColor];
            _backgroundView.alpha = 0.5;
//          增加手势
            [_backgroundView addGestureRecognizer:({
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dissmissDeleteView)];
                tapGesture;
            })];
            _backgroundView;
        })];
//        button初始大小为0 然后在show中操作实现d动画效果
        [self addSubview:({
            _deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            [_deleteButton addTarget:self action:@selector(_clickButton) forControlEvents:UIControlEventTouchUpInside];
            _deleteButton.backgroundColor = [UIColor lightGrayColor];
            [_deleteButton setTitle:@"删除" forState:UIControlStateNormal];
            _deleteButton;
        })];
        
    }
    return self;
}

// 将整个View加到app的最上层
- (void)showDeleteViewFromPoint:(CGPoint) point clickBlock:(dispatch_block_t) clickBlock{
    _deleteButton.frame = CGRectMake(point.x, point.y, 0, 0);
//    点击时持有这个block
    _deleteBlock = [clickBlock copy];
    
    [[UIApplication sharedApplication].windows[0] addSubview:self];
//   动画从初始位置到结束位置
//    [UIView animateWithDuration:1.f animations:^{
//        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 200)/2, (self.bounds.size.height - 200)/2, 200, 200);
//    }];
    
    [UIView animateWithDuration:1.f delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.deleteButton.frame = CGRectMake((self.bounds.size.width - 100)/2, (self.bounds.size.height - 100)/2, 100, 50);
        self.deleteButton.layer.cornerRadius = 25;
    } completion:^(BOOL finished) {
        //        动画结束之后需要处理的逻辑
        NSLog(@"animateWithDuration finished");
    }];
}

- (void)dissmissDeleteView {
    [self removeFromSuperview];
}

- (void)_clickButton {
    if (_deleteBlock) {
        _deleteBlock();
    }
    [self removeFromSuperview];
}

@end
