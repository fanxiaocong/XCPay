//
//  XCPayApplication.h
//  XCPayExample
//
//  Created by 樊小聪 on 2017/9/25.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：处理与AppDelegate相关的设置 🐾
 */

#import <UIKit/UIKit.h>

@interface XCPayApplication : NSObject

+ (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

// iOS 9.0 之前
+ (void)application:(UIApplication *)application handleOpenURL:(NSURL *)url;

+ (void)application:(UIApplication *)application
               openURL:(NSURL *)url
     sourceApplication:(NSString *)sourceApplication
            annotation:(id)annotation;

// iOS 9.0 以后使用
+ (void)application:(UIApplication *)app
               openURL:(NSURL *)url
               options:(NSDictionary<NSString*, id> *)options;

@end
