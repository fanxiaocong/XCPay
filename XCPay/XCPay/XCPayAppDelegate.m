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

#import "XCPayAppDelegate.h"

#import "XCPayManager.h"



@implementation XCPayAppDelegate

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

+ (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    BOOL isSuccess = NO;

    for (id<XCPayFactoryProtocol> factory in [self payFactorys])
    {
        id<XCPayProtocol> pay = factory.pay;
        
        if ([pay respondsToSelector:@selector(applicationDidFinishLaunching:)])
        {
            BOOL result = [pay application:application didFinishLaunchingWithOptions:launchOptions];
            
            if (result) {
                isSuccess = YES;
            }
        }
    }
    
    return isSuccess;
}

// iOS 9.0 之前
+ (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    BOOL isSuccess = NO;

    for (id<XCPayFactoryProtocol> factory in [self payFactorys])
    {
        id<XCPayProtocol> pay = factory.pay;
        
        if ([pay respondsToSelector:@selector(application:handleOpenURL:)])
        {
            BOOL result = [pay application:application handleOpenURL:url];
            
            if (result) {
                isSuccess = YES;
            }
        }
    }
    
    return isSuccess;
}

+ (BOOL)application:(UIApplication *)application
               openURL:(NSURL *)url
     sourceApplication:(NSString *)sourceApplication
            annotation:(id)annotation
{
    BOOL isSuccess = NO;

    for (id<XCPayFactoryProtocol> factory in [self payFactorys])
    {
        id<XCPayProtocol> pay = factory.pay;
        
        if ([pay respondsToSelector:@selector(application:openURL:sourceApplication:annotation:)])
        {
            BOOL result = [pay application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
            
            if (result) {
                isSuccess = YES;
            }
        }
    }
    
    return isSuccess;
}

// iOS 9.0 以后使用
+ (BOOL)application:(UIApplication *)app
               openURL:(NSURL *)url
               options:(NSDictionary<NSString*, id> *)options
{
    BOOL isSuccess = NO;

    for (id<XCPayFactoryProtocol> factory in [self payFactorys])
    {
        id<XCPayProtocol> pay = factory.pay;
        
        if ([pay respondsToSelector:@selector(application:openURL:options:)])
        {
            BOOL result = [pay application:app openURL:url options:options];
            
            if (result) {
                isSuccess = YES;
            }
        }
    }
    
    return isSuccess;
}


@end
