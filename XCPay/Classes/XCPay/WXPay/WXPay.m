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


/* 根据项目需求，集成 微信支付 Api */
#import <WechatOpenSDK/WXApi.h>

#define URL_HOST    @"pay"


@interface WXPay ()<WXApiDelegate>

@property (copy, nonatomic) void(^completeHandle)(XCPayResultStatus resutStatus);

@property (copy, nonatomic) NSString *appKey;
@property (copy, nonatomic) NSString *universalLink;

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

- (instancetype)initWithConfigure:(XCPayPlatformConfigure *)configure
{
    if (self = [super init])
    {
        self.appKey = configure.appKey;
        self.universalLink = configure.universalLink;
    }
    
    return self;
}


- (void)payWithOrderInfo:(id<WXPayOrderInfoProtocol>)orderInfo
          completeHandle:(void (^)(XCPayResultStatus))completeHandle
{
    if (![orderInfo conformsToProtocol:@protocol(WXPayOrderInfoProtocol)])
    {
        if (completeHandle)
        {
            completeHandle(XCPayResultStatusFailure);
        }
        return;
    }
    
    self.completeHandle = completeHandle;
    
    PayReq *req     = [[PayReq alloc] init];
    req.openID      = orderInfo.wx_appId;
    req.partnerId   = orderInfo.wx_partnerId;
    req.prepayId    = orderInfo.wx_prepayId;
    req.nonceStr    = orderInfo.wx_nonceStr;
    req.timeStamp   = orderInfo.wx_timeStamp;
    req.package     = orderInfo.wx_package;
    req.sign        = orderInfo.wx_sign;
    
    [WXApi sendReq:req completion:nil];
}

#pragma mark - 📕 👀 PayAppDelegateProtocol 👀

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 注册微信 AppKey
    return [WXApi registerApp:self.appKey universalLink:self.universalLink];
}

// iOS 9.0 之前
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    /// 微信
    if ([url.host isEqualToString:URL_HOST])
    {
        return [WXApi handleOpenURL:url delegate:self];
    }
    
    return NO;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    /// 微信
    if ([url.host isEqualToString:URL_HOST])
    {
        return [WXApi handleOpenURL:url delegate:self];
    }
    
    return NO;
}

// iOS 9.0 以后使用
- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<NSString*, id> *)options
{
    /// 微信
    if ([url.host isEqualToString:URL_HOST])
    {
        return [WXApi handleOpenURL:url delegate:self];
    }
    
    return NO;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> *))restorationHandler
{
    /// 微信
    return [WXApi handleOpenUniversalLink:userActivity delegate:self];
}

#pragma mark - 💉 👀 WXApiDelegate 👀

- (void)onResp:(BaseResp *)resp
{
    /// 处理支付结果
    [self payResultCallBack:resp];
}

@end

