//
//  AppDelegate.m
//  DesktopFunctionBall
//
//  Created by 茭白 on 2017/6/13.
//  Copyright © 2017年 茭白. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseNavigationViewController.h"
#import "JBMainViewController.h"
#import "JBMessageViewController.h"
#import "JBMyViewController.h"
#import "BaseTabBarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor=[UIColor whiteColor];
    [self.window makeKeyAndVisible];
    //开启手机网络监测
    //[self startMonitorNetwork];
    //设置系统的返回按钮图片
    UIImage *img = [UIImage imageNamed:@"back"];
    [[UINavigationBar appearance] setBackIndicatorImage:img];
    [[UINavigationBar appearance] setBackIndicatorTransitionMaskImage:img];
    [self initTabBarView];
    // Override point for customization after application launch.
    return YES;
}

-(void)initTabBarView
{
    
    UIImage *image=[UIImage imageNamed:@"tabbar_seedoct"];
    UIImage *selectedImage=[UIImage imageNamed:@"tabbar_seedoctHighed"];
    selectedImage=[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //主页面
    JBMainViewController *mainVC=[[JBMainViewController alloc]init];
    BaseNavigationViewController *mianNav=[[BaseNavigationViewController alloc]initWithRootViewController:mainVC];
    //mianNav.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"主页" image:image tag:0];
    mianNav.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"主页" image:image selectedImage:selectedImage];
    //信息页面
    JBMessageViewController *messageVC=[[JBMessageViewController alloc]init];
    messageVC.tabBarItem.title=@"主页";
    BaseNavigationViewController *messageNav=[[BaseNavigationViewController alloc]initWithRootViewController:messageVC];
    //messageNav.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"消息" image:image tag:1];
    messageNav.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"信息" image:image selectedImage:selectedImage];
    
    //我的页面
    JBMyViewController *myVC=[[JBMyViewController alloc]init];
    
    BaseNavigationViewController *myNav=[[BaseNavigationViewController alloc]initWithRootViewController:myVC];
    
    //myNav.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"我" image:image tag:2];
    myNav.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"我" image:image selectedImage:selectedImage];
    
    
    BaseTabBarViewController *tabBarVC=[[BaseTabBarViewController alloc]init];
    
    [tabBarVC setViewControllers:[NSMutableArray arrayWithObjects:mianNav,messageNav,myNav, nil] animated:YES];
    
    
    
    //AppDelegate *appdelegate=[UIApplication sharedApplication].delegate;
    self.window.rootViewController=tabBarVC;
    
    //[self setViewControllers:[NSMutableArray arrayWithObjects:mianNav,messageNav,myNav, nil] animated:YES];
    
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
