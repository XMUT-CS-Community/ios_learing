//
//  NormalTableViewCell.m
//  SimpleApp
//
//  Created by codingzhe on 2020/3/24.
//  Copyright © 2020 codingzhe. All rights reserved.
//

#import "NormalTableViewCell.h"
#import "ListItem.h"
#import "SDWebImage.h"

@interface NormalTableViewCell()

@property(nonatomic,strong,readwrite) UILabel *titleLabel;
@property(nonatomic,strong,readwrite) UILabel *sourceLabel;
@property(nonatomic,strong,readwrite) UILabel *commentLabel;
@property(nonatomic,strong,readwrite) UILabel *timeLabel;
@property(nonatomic,strong,readwrite) UIImageView *rightimageView;
@property(nonatomic,strong,readwrite) UIButton *deleteButton;

@end

@implementation NormalTableViewCell

// 重写初始化g方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 270, 50)];
//        self.titleLabel.backgroundColor = [UIColor redColor];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
//        self.timeLabel.textColor = [UIColor blackColor];
        self.titleLabel.numberOfLines = 2;
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:self.titleLabel];
        
        
        self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 70, 50, 20)];
//        self.sourceLabel.backgroundColor = [UIColor redColor];
        self.sourceLabel.font = [UIFont systemFontOfSize:12];
        self.sourceLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.sourceLabel];
        
        
        self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 70, 50, 20)];
//        self.commentLabel.backgroundColor = [UIColor redColor];
        self.commentLabel.font = [UIFont systemFontOfSize:12];
        self.commentLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.commentLabel];
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 70, 50, 20)];
//        self.timeLabel.backgroundColor = [UIColor yellowColor];
        self.timeLabel.font = [UIFont systemFontOfSize:12];
        self.timeLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:self.timeLabel];
        
        self.rightimageView = [[UIImageView alloc] initWithFrame:CGRectMake(290, 15, 70, 70)];
//        self.rightimageView.backgroundColor = [UIColor lightGrayColor];
        self.rightimageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.rightimageView];
   
//        删除按钮
//        self.deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(330, 80, 30, 20)];
//        [self.deleteButton setImage:[UIImage imageNamed:@"icon.bundle/shanchu.png"] forState:UIControlStateNormal];
////        [self.deleteButton setTitle:@"X" forState:UIControlStateNormal];
//        [self.deleteButton setImage:[UIImage imageNamed:@"icon.bundle/shanchu_1.png"] forState:UIControlStateHighlighted];
////        使用calayer实现圆角
//        self.deleteButton.layer.cornerRadius = 10;
//        self.deleteButton.layer.masksToBounds = YES;
////          calayer实现边框
////        self.deleteButton.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor lightGrayColor]);
////        self.deleteButton.layer.borderWidth = 2;
//
////        当button点击时，会调用deleteButtonClick方法
//        [self.deleteButton addTarget:self action:@selector(deleteButtonClick) forControlEvents:UIControlEventTouchUpInside];
////        self.deleteButton.backgroundColor = [UIColor lightGrayColor];
//        [self.contentView addSubview:self.deleteButton];
//
    }
    return self;
}

// 给table赋值
- (void) layoutTableViewCellWithItem:(ListItem *)item {
    
    BOOL hashRead = [[NSUserDefaults standardUserDefaults] boolForKey:item.uniquekey];
    if (hashRead) {
        self.titleLabel.textColor = [UIColor lightGrayColor];
    }else {
        self.titleLabel.textColor = [UIColor blackColor];
    }
    
    self.titleLabel.text = item.title;
    self.sourceLabel.text = item.authorName;
    [self.sourceLabel sizeToFit];
    self.commentLabel.text = item.category;
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text = item.date;
    [self.timeLabel sizeToFit];
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 15, self.timeLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    

//    NSthread创建线程实现图片加载
//    NSThread *downloadImageThread = [[NSThread alloc] initWithBlock:^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//        self.rightimageView.image = image;
//    }];
//
//    downloadImageThread.name = @"downloadImageThread";
//    [downloadImageThread start];
    
    
//    GCD加载网络图片
//    dispatch_queue_global_t downloadQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
//    dispatch_queue_main_t mainQueue = dispatch_get_main_queue();
//
//    dispatch_async(downloadQueue, ^{
//        UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:item.picUrl]]];
//        dispatch_async(mainQueue, ^{
//            self.rightimageView.image = image;
//        });
//    });
    
//    SDWebImage加载网络图片
    [self.rightimageView sd_setImageWithURL:[NSURL URLWithString:item.picUrl] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        NSLog(@"");
    }];
    
    
    
}

- (void)deleteButtonClick {
    NSLog(@"deleteButtonClick");
//    除了判断delegatec之外，还需要判断delegate的抽象函数是否有实现
    if (self.delegate && [self.delegate respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton:self.deleteButton];
    }
}

@end
