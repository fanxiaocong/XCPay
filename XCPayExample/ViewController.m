//
//  ViewController.m
//  XCPayExample
//
//  Created by 樊小聪 on 2017/9/25.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "ViewController.h"
#import "XCPayManager.h"
#import "WXPayParamModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - 🔒 👀 Privite Method 👀

/**
 *  处理支付结果的回调
 */
- (void)handlePayResult:(XCPayResultStatus)resultStatus
{
    switch (resultStatus)
    {
        case XCPayResultStatusSuccess:      /// 手机端支付成功
        {
            break;
        }
        case XCPayResultStatusCancel:       /// 支付取消
        {
            break;
        }
        case XCPayResultStatusFailure:      /// 支付失败
        {
            break;
        }
        case XCPayResultStatusNetworkError: /// 网络连接失败
        {
            break;
        }
        case XCPayResultStatusWaiting:      /// 正在处理中
        {
            break;
        }
    }
}

#pragma mark - 🎬 👀 Action Method 👀

- (IBAction)didClickWeChatPayButtonAction:(id)sender
{
    /// 微信支付
    id<XCPayFactoryProtocol> payFactory = [[XCPayManager sharePayManager] payFactoryWithPlatformType:XCPayPlatformTypeWeXin];
    id<XCPayProtocol> pay = payFactory.pay;
    
    /// 此处模拟微信支付的参数
    WXPayParamModel *paramM = [[WXPayParamModel alloc] init];
    
    __weak typeof(self)weakSelf = self;
    [pay payWithOrderInfo:paramM completeHandle:^(XCPayResultStatus resultStatus) {
        // 支付结果的回调
        [weakSelf handlePayResult:resultStatus];
    }];
}

- (IBAction)didClickAlipayButtonAction:(id)sender
{
    /// 支付宝支付
    id<XCPayFactoryProtocol> payFactory = [[XCPayManager sharePayManager] payFactoryWithPlatformType:XCPayPlatformTypeAliy];
    id<XCPayProtocol> pay = payFactory.pay;
    
    __weak typeof(self)weakSelf = self;
    [pay payWithOrderInfo:@"支付宝订单签名参数" completeHandle:^(XCPayResultStatus resultStatus) {
        // 支付结果的回调
        [weakSelf handlePayResult:resultStatus];
    }];
}

@end
