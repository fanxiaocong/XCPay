//
//  XCAppDelegate.m
//  XCPay
//
//  Created by fanxiaocong on 04/27/2021.
//  Copyright (c) 2021 fanxiaocong. All rights reserved.
//

#import "XCAppDelegate.h"
#import <XCPay/XCPayManager.h>
#import <XCPay/XCPayAppDelegate.h>

@implementation XCAppDelegate

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
                                        config.universalLink = @"xxx";
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

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler
{
    return [XCPayAppDelegate application:application continueUserActivity:userActivity restorationHandler:restorationHandler];
}


@end
