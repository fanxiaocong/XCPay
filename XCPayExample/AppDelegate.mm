//
//  AppDelegate.m
//  XCPayExample
//
//  Created by 樊小聪 on 2017/9/25.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "AppDelegate.h"
#import "XCPayManager.h"
#import "XCPayAppDelegate.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /// 支付相关的配置
    [XCPayManager configurePayActivePlatforms:@[@(XCPayPlatformTypeAliy),
                                                @(XCPayPlatformTypeWeXin)]
                            platformConfigure:^(XCPayPlatformConfigure *config) {
                                
                                switch (config.platformType)
                                {
                                    case XCPayPlatformTypeAliy:
                                    {
                                        config.appScheme = @"AliyPay";
                                        break;
                                    }
                                    case XCPayPlatformTypeWeXin:
                                    {
                                        config.appKey = @"WexinPay";
                                        break;
                                    }
                                }
                            }];
    
    [XCPayAppDelegate application:application didFinishLaunchingWithOptions:launchOptions];
    
    return YES;
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options
{
    return [XCPayAppDelegate application:app openURL:url options:options];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return [XCPayAppDelegate application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return [XCPayAppDelegate application:application handleOpenURL:url];
}


@end
