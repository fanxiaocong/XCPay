//
//  WXPayParamModel.m
//  XCPayExample
//
//  Created by 樊小聪 on 2018/5/31.
//  Copyright © 2018年 樊小聪. All rights reserved.
//

/*
 *  备注：微信支付参数模型 🐾
 */

#import "WXPayParamModel.h"

@implementation WXPayParamModel

#pragma mark - 💉 👀 WXPayOrderInfoProtocol 👀

- (NSString *)wx_appId
{
    return self.appId;
}

- (NSString *)wx_partnerId
{
    return self.partnerId;
}

- (NSString *)wx_prepayId
{
    return self.prepayId;
}

- (NSString *)wx_nonceStr
{
    return self.nonceStr;
}

- (UInt32)wx_timeStamp
{
    return self.timeStamp;
}

- (NSString *)wx_package
{
    return self.packageValue;
}

- (NSString *)wx_sign
{
    return self.sign;
}

@end
