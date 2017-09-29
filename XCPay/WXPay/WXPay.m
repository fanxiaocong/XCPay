//
//  WXPay.m
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/3.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：微信支付实体类 🐾
 */


#import "WXPay.h"

#import "WXPayOrderInfoProtocol.h"



#import "WXApi.h"

#define APP_KEY     @""
#define URL_HOST    @"safe"


@interface WXPay ()<WXApiDelegate>

@property (copy, nonatomic) void(^completeHandle)(XCPayResultStatus resutStatus);

@end
 


@implementation WXPay


#pragma mark - 🔒 👀 Privite Method 👀

/**
 *  支付结果的回调
 */
- (void)payResultCallBack:(id)result
{
    if ([result isKindOfClass:[PayResp class]])
    {
        PayResp *response = result;
        
        XCPayResultStatus resultStatus = XCPayResultStatusFailure;
        
        switch (response.errCode)
        {
            case WXSuccess:             // 成功
            {
                resultStatus = XCPayResultStatusSuccess;
                break;
            }
            case WXErrCodeUserCancel:   // 取消
            {
                resultStatus = XCPayResultStatusCancel;
                break;
            }
            default:                    // 失败
            {
                resultStatus = XCPayResultStatusFailure;
                break;
            }
        }
        
        //----  回调
        if (self.completeHandle)
        {
            self.completeHandle(resultStatus);
        }
    }
}

#pragma mark - 📕 👀 PayProtocol 👀

- (void)payWithOrderInfo:(id<WXPayOrderInfoProtocol>)orderInfo
          completeHandle:(void (^)(XCPayResultStatus))completeHandle
{
    PayReq *req     = [[PayReq alloc] init];
    req.openID      = orderInfo.appId;
    req.partnerId   = orderInfo.partnerId;
    req.prepayId    = orderInfo.prepayId;
    req.nonceStr    = orderInfo.nonceStr;
    req.timeStamp   = orderInfo.timeStamp;
    req.package     = orderInfo.package;
    req.sign        = orderInfo.sign;
    
    [WXApi sendReq:req];
}

#pragma mark - 📕 👀 PayAppDelegateProtocol 👀

- (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 注册微信 AppKey
    [WXApi registerApp:APP_KEY];
}

// iOS 9.0 之前
- (void)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    /// 微信
    if ([url.host isEqualToString:URL_HOST])
    {
        [WXApi handleOpenURL:url delegate:self];
    }
}

- (void)application:(UIApplication *)application
               openURL:(NSURL *)url
     sourceApplication:(NSString *)sourceApplication
            annotation:(id)annotation
{
    /// 微信
    if ([url.host isEqualToString:URL_HOST])
    {
        [WXApi handleOpenURL:url delegate:self];
    }
}

// iOS 9.0 以后使用
- (void)application:(UIApplication *)app
               openURL:(NSURL *)url
               options:(NSDictionary<NSString*, id> *)options
{
    /// 微信
    if ([url.host isEqualToString:URL_HOST])
    {
        [WXApi handleOpenURL:url delegate:self];
    }
}

#pragma mark - 💉 👀 WXApiDelegate 👀

- (void)onResp:(BaseResp *)resp
{
    /// 支付结果的回调
    [self payResultCallBack:resp];
}

@end

