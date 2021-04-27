//
//  Alipay.m
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/3.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "Alipay.h"


/* --- 根据项目需要信息 支付宝 Api */
#import <AlipaySDK/AlipaySDK.h>


// ------ 支付宝 AppScheme
#define URL_HOST    @"safepay"


@interface Alipay ()

@property (copy, nonatomic) void(^completeHandle)(XCPayResultStatus resutStatus);

@property (copy, nonatomic) NSString *appScheme;

@end


@implementation Alipay

#pragma mark - 🔒 👀 Privite Method 👀

/**
 *  支付结果的回调
 */

- (void)payResultCallBack:(NSDictionary *)resultDic
{
    NSLog(@"********支付宝支付结果回调：%@", resultDic);
    
    XCPayResultStatus resultStatus = XCPayResultStatusFailure;
    
    NSString *result = resultDic[@"resultStatus"];
    
    if ([result isEqualToString:@"9000"])
    {
        /// 支付成功
        resultStatus = XCPayResultStatusSuccess;
    }
    else if ([result isEqualToString:@"8000"])
    {
        /// 正在处理中
        resultStatus = XCPayResultStatusWaiting;
    }
    else if ([result isEqualToString:@"6001"])
    {
        /// 已取消支付
        resultStatus = XCPayResultStatusCancel;
    }
    else if ([result isEqualToString:@"6002"])
    {
        /// 网络连接出错
        resultStatus = XCPayResultStatusNetworkError;
    }
    else if ([result isEqualToString:@"4000"])
    {
        /// 支付失败
        resultStatus = XCPayResultStatusFailure;
    }
    
    if (self.completeHandle)
    {
        self.completeHandle(resultStatus);
    }
}

#pragma mark - 📕 👀 XCPayProtocol 👀

- (instancetype)initWithConfigure:(XCPayPlatformConfigure *)configure
{
    if (self = [super init])
    {
        self.appScheme = configure.appScheme;
    }
    
    return self;
}

- (void)payWithOrderInfo:(id)orderInfo
          completeHandle:(void (^)(XCPayResultStatus))completeHandle
{
    if (![orderInfo isKindOfClass:[NSString class]])
    {
        if (completeHandle)
        {
            completeHandle(XCPayResultStatusFailure);
        }
        return;
    }
    
    self.completeHandle = completeHandle;
    
    //----- 调用支付结果开始支付
    [[AlipaySDK defaultService] payOrder:orderInfo fromScheme:self.appScheme callback:^(NSDictionary *resultDic) {
        
        /// 处理支付结果的回调
        [self payResultCallBack:resultDic];
    }];
}


#pragma mark - 📕 👀 XCPayAppDelegateProtocol 👀

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    /// 支付宝
    if ([url.host isEqualToString:URL_HOST])
    {
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic){
            /// 处理支付结果的回调
            [self payResultCallBack:resultDic];
        }];
        
        return YES;
    }
    
    return NO;
}

// iOS 9.0 以后使用
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<NSString*, id> *)options
{
    if ([url.host isEqualToString:URL_HOST])
    {
        // 支付跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            /// 处理支付结果的回调
            [self payResultCallBack:resultDic];
        }];
        
        return YES;
    }
    
    return NO;
}

@end
