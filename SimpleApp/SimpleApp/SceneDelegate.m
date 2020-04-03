#import "SceneDelegate.h"
#import "NewsViewController.h"
#import "VideoViewController.h"
#import "RecommendViewController.h"

// UITabBarControllerDelegate 声明需要实现的协议
@interface SceneDelegate ()<UITabBarControllerDelegate>

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;
//--------------------------------------------------------
    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    //    除此之外还需要将tabbarcontroller包含的viewController显示出来
    
    NewsViewController *newsViewController = [[NewsViewController alloc] init];
    VideoViewController *videoController = [[VideoViewController alloc] init];
    RecommendViewController *recommendViewController = [[RecommendViewController alloc] init];
//    这个controller是没有视图的，需要通过一个viewcontroller作为x整体视图的展示
        
//    UIViewController *controller1 = [[UIViewController alloc] init];
//    navigationController.view.backgroundColor = [UIColor redColor];

//    UIViewController *controller2 = [[UIViewController alloc] init];
//    videoController.tabBarItem.title = @"视频";
//    videoController.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/icon-test.png"];
////   选中时的图片
//    videoController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/icon-test.png"];
//    UIViewController *controller3 = [[UIViewController alloc] init];
   
    
    UIViewController *mineViewController = [[UIViewController alloc] init];
    mineViewController.view.backgroundColor = [UIColor lightGrayColor];
    mineViewController.tabBarItem.title = @"我的";
    mineViewController.tabBarItem.image = [UIImage imageNamed:@"icon.bundle/weixin.png"];
    //   选中时的图片
    mineViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"icon.bundle/weixin.png"];
    
//    将四个controller加入到tabbarcontroller中
    [tabbarController setViewControllers:@[newsViewController,videoController,recommendViewController,mineViewController]];
    
    tabbarController.delegate = self;
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:tabbarController];
    
    self.window.rootViewController = navigationController;
    [self.window makeKeyAndVisible];
    NSLog(@"testtabbar=========");
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"did select");
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}




@end
