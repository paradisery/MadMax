//
//  AppDelegate.m
//  MadMax+
//
//  Created by ruany on 2016/12/1.
//  Copyright © 2016年 ruany. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"
#import "BaseViewController.h"
#import "LeftViewController.h"
#import "leftVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [self initDrawer]; //初始左侧菜单项
    
    [self myDrawer];
    return YES;
}
- (void)myDrawer {
    //创建窗口
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    //设置背景颜色
    _window.backgroundColor = [UIColor whiteColor];
    //显示window
    [_window makeKeyAndVisible];
    
    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
//    BaseViewController *baseVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"base"];
    
//    leftVC *lVC = [[leftVC alloc]init];
    RootViewController *rootVC = [[RootViewController alloc] initWithLeftViewController:[mainStoryboard instantiateViewControllerWithIdentifier:@"leftmenu"] withCenterViewController:[mainStoryboard instantiateViewControllerWithIdentifier:@"NAV"]];
    
    _window.rootViewController = rootVC;

}
- (void)initDrawer {
    
    self.window.backgroundColor=[UIColor whiteColor];
    self.window.viewForLastBaselineLayout.backgroundColor=[UIColor whiteColor];

    UIStoryboard* mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    drawerController = [[MMDrawerController alloc] initWithCenterViewController:[mainStoryboard instantiateViewControllerWithIdentifier:@"NAV"] leftDrawerViewController:[mainStoryboard instantiateViewControllerWithIdentifier:@"leftmenu"]];
    
    [drawerController setDrawerVisualStateBlock:[MMDrawerVisualState slideAndScaleVisualStateBlock]];
    [drawerController setMaximumLeftDrawerWidth:260.0];
    [drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModePanningNavigationBar];
    [drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    self.window.rootViewController = drawerController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
