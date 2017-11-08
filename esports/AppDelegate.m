//
//  AppDelegate.m
//  esports
//
//  Created by 尚银东 on 2017/9/25.
//  Copyright © 2017年 shangyd. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate.h"
#import "ViewController.h"
#import <WeexSDK/WXSDKEngine.h>
#import <WeexSDK/WXLog.h>
#import <WeexSDK/WXDebugTool.h>
#import <WeexSDK/WXAppConfiguration.h>
#import "WXImgLoaderDefaultImpl.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self initWeexSDK];
    UINavigationController *nac = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window setRootViewController:nac];
    [self.window makeKeyAndVisible];
    
    return YES;
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

- (void)initWeexSDK {
    //业务配置，非必需
    [WXAppConfiguration setAppGroup:@"SdwApp"];
    [WXAppConfiguration setAppName:@"esports"];
    [WXAppConfiguration setAppVersion:@"1.0.0"];
    
    //初始化SDK环境
    [WXSDKEngine initSDKEnvironment];
    
    //注册自定义module和component，非必需
    /*
     [WXSDKEngine registerComponent:@"MyView" withClass:[MyViewComponent class]];
     [WXSDKEngine registerModule:@"event" withClass:[WXEventModule class]];
     */
    //注册协议的实现类，非必需
    [WXSDKEngine registerHandler:[WXImgLoaderDefaultImpl new] withProtocol:@protocol(WXImgLoaderProtocol)];
    
    //设置Log输出等级：调试环境默认为Debug，正式发布会自动关闭。
    [WXLog setLogLevel:WXLogLevelAll];
    
    // 开启debug模式
    // [WXDebugTool setDebug:YES];
}

@end
