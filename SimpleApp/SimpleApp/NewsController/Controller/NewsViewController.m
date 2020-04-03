//
//  NewsViewController.m
//  SimpleApp
//
//  Created by codingzhe on 2020/3/22.
//  Copyright © 2020 codingzhe. All rights reserved.
//

#import "NewsViewController.h"
#import "NormalTableViewCell.h"
#import "DetailViewController.h"
#import "DeleteCellView.h"
#import "ListLoader.h"
#import "ListItem.h"

@interface NewsViewController ()<UITableViewDataSource, UITableViewDelegate, NormalTableViewCellDelegate>
@property (nonatomic, strong, readwrite) UITableView *tableView;
@property (nonatomic, strong, readwrite) NSArray *dataArray;
@property (nonatomic, strong, readwrite) ListLoader *listLoader;
@end

@implementation NewsViewController

#pragma mark - lefe cycle
- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBarItem.title = @"新闻";
    self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/news.png"];
//   选中时的图片
    self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/new-selected.png"];

// tableView 设置和view一样大小
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];

//    设置datasource
    _tableView.dataSource = self;
//    设置tableViewDelegate
    _tableView.delegate = self;
//    加到视图结构中
    [self.view addSubview:_tableView];
    
    self.listLoader = [[ListLoader alloc] init];
     __weak typeof(self) wself = self;
    [self.listLoader loadListDataWithFinishBlock:^(BOOL success, NSArray<ListItem *> * _Nonnull dataArray) {
        __strong typeof(self) strongSelf = wself;
        strongSelf.dataArray = dataArray;
        [strongSelf.tableView reloadData];
    }];
}

#pragma mark - UITableViewDelegate
/*************************UiTableView的dataource即是它的deleagte协议【 ***********************************/
//返回整个tableview又多少个cell
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

// cell具体内容 reuseIdentifier是cell的id initWithStyle 是样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
// dequeueReusableCellWithIdentifier 从复用回收池中取cell 如果没有再创建一个
    NormalTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id"];

    if (!cell) {
        cell = [[NormalTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
        cell.delegate = self;
    }
    [cell layoutTableViewCellWithItem:[self.dataArray objectAtIndex:indexPath.row]];
    return cell;
}

/*************************TableViewDelegate***********************************/
// 设置UITableView的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

// 点击之后的操作在这个函数里操作
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ListItem *item = [self.dataArray objectAtIndex:indexPath.row];
    DetailViewController *viewController = [[DetailViewController alloc] initWithUrlString:item.articleUrl];
    viewController.view.backgroundColor = [UIColor whiteColor];
    viewController.title = [NSString stringWithFormat:@"%@", @(indexPath.row)];
// navigationController推进一个新的页面
    [self.navigationController pushViewController:viewController animated:YES];
    
//    设置已读的key-value
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:item.uniquekey];
}

//实现自定义delegate提供的方法
- (void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton {
//    DeleteCellView *deleteView = [[DeleteCellView alloc] initWithFrame:self.view.bounds];
////    将deleteButton的坐标系转换到window的坐标系中
//    CGRect rect = [tableViewCell convertRect:deleteButton.frame toView:nil];
//
////    处理循环引用的问题
//    __weak typeof(self) wself = self;
//
//    [deleteView showDeleteViewFromPoint:rect.origin clickBlock:^{
////        NSLog(@"clickBlock");
//        __strong typeof(self) strongSelf = wself;
//        [strongSelf.dataArray removeLastObject];
//        [strongSelf.tableView deleteRowsAtIndexPaths:@[[strongSelf.tableView indexPathForCell:tableViewCell]] withRowAnimation:UITableViewRowAnimationAutomatic];
//    }];
}

@end
