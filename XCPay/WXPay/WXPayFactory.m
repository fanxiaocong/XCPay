//
//  WXPayFactory.m
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/3.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：微信支付实体工厂 🐾
 */



#import "WXPayFactory.h"

@implementation WXPayFactory
{
    XCPayPlatformConfigure *_wxConfigure;
    WXPay *_wxpay;
}

#pragma mark - 📕 👀 PayFactoryProtocol 👀

- (instancetype)initWithPlatformConfigure:(XCPayPlatformConfigure *)configure
{
    if (self = [super init])
    {
        _wxConfigure = configure;
        _wxpay = [[WXPay alloc] initWithConfigure:configure];
    }
    
    return self;
}

- (XCPayPlatformConfigure *)configure
{
    return _wxConfigure;
}

- (id<XCPayProtocol>)pay
{
    return _wxpay;
}

@end

