//
//  XCPayApplication.m
//  XCPayExample
//
//  Created by 樊小聪 on 2017/9/25.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：处理与AppDelegate相关的设置 🐾
 */

#import "XCPayApplication.h"

#import "XCPayManager.h"



@implementation XCPayApplication

#pragma mark - 🔒 👀 Privite Method 👀

/**
 *  返回当前所有可用的支付平台
 */
+ (NSArray<id<XCPayFactoryProtocol>> *)payFactorys
{
    XCPayManager *mgr = [XCPayManager sharePayManager];
    return mgr.allFactorys;
}

#pragma mark - 🔓 👀 Public Method 👀

+ (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    for (id<XCPayFactoryProtocol> factory in [self payFactorys])
    {
        id<XCPayProtocol> pay = factory.pay;
        
        if ([pay respondsToSelector:@selector(applicationDidFinishLaunching:)])
        {
            [pay application:application didFinishLaunchingWithOptions:launchOptions];
        }
    }
}

// iOS 9.0 之前
+ (void)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    for (id<XCPayFactoryProtocol> factory in [self payFactorys])
    {
        id<XCPayProtocol> pay = factory.pay;
        
        if ([pay respondsToSelector:@selector(application:handleOpenURL:)])
        {
            [pay application:application handleOpenURL:url];
        }
    }
}

+ (void)application:(UIApplication *)application
               openURL:(NSURL *)url
     sourceApplication:(NSString *)sourceApplication
            annotation:(id)annotation
{
    for (id<XCPayFactoryProtocol> factory in [self payFactorys])
    {
        id<XCPayProtocol> pay = factory.pay;
        
        if ([pay respondsToSelector:@selector(application:openURL:sourceApplication:annotation:)])
        {
            [pay application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
        }
    }
}

// iOS 9.0 以后使用
+ (void)application:(UIApplication *)app
               openURL:(NSURL *)url
               options:(NSDictionary<NSString*, id> *)options
{
    for (id<XCPayFactoryProtocol> factory in [self payFactorys])
    {
        id<XCPayProtocol> pay = factory.pay;
        
        if ([pay respondsToSelector:@selector(application:openURL:options:)])
        {
            [pay application:app openURL:url options:options];
        }
    }
}


@end
