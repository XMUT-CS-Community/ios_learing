//
//  RecommendViewController.m
//  SimpleApp
//
//  Created by codingzhe on 2020/3/24.
//  Copyright © 2020 codingzhe. All rights reserved.
//

#import "RecommendViewController.h"

@interface RecommendViewController () <UIScrollViewDelegate, UIGestureRecognizerDelegate>

@end

@implementation RecommendViewController


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"推荐";
        self.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/mingxinghuodong.png"];
       //   选中时的图片
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/mingxinghuodong.png"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"recommend viewController");
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor lightGrayColor];
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 5, self.view.bounds.size.height);
//    scrollView.showsHorizontalScrollIndicator = NO;
    NSArray *colorArray = @[[UIColor redColor],[UIColor greenColor],[UIColor brownColor],[UIColor blueColor],[UIColor yellowColor]];
    
    scrollView.delegate = self;
    
    for (int i = 0; i < 5; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(scrollView.bounds.size.width * i, 0, scrollView.bounds.size.width, scrollView.bounds.size.height)];
        
        [view addSubview:({
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
            view.backgroundColor = [UIColor lightGrayColor];
            
//           添加gesture手势 点击手势
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
            tapGesture.delegate = self;
//            将手势加入到view中
            [view addGestureRecognizer:tapGesture];
            
            
            view;
        })];
        
        view.backgroundColor = [colorArray objectAtIndex:i];
        [scrollView addSubview:view];
    }
//    翻页效果
    scrollView.pagingEnabled = YES;
    [self.view addSubview:scrollView];
}

// 只要scrollView滚动就会回调到delegate 当有任何滚动时 就会调用到s这个函数
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewDidScroll - %@", @(scrollView.contentOffset.x));
}

// called on start of dragging (may require some time and or distance to move)
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    NSLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//        NSLog(@"scrollViewDidEndDragging");
}

// 两个减速函数
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
}


- (void)viewClick {
    NSLog(@"viewClick");
}


- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}

@end
