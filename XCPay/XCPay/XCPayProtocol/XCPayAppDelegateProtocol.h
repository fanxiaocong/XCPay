//
//  PayAppDelegateProtocol.h
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/3.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：支付与AppDelelgate相关的协议 🐾
 */

#import <UIKit/UIKit.h>

@protocol XCPayAppDelegateProtocol <NSObject>

#pragma mark - 👀 AppDelegate 相关方法 👀 💤

@optional
- (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

// iOS 9.0 之前
- (void)application:(UIApplication *)application handleOpenURL:(NSURL *)url;

- (void)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation;

// iOS 9.0 以后使用
- (void)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<NSString*, id> *)options;

@end
