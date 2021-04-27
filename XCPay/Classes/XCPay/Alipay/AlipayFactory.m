//
//  AlipayFactory.m
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/3.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：支付宝支付实体工厂 🐾
 */

#import "AlipayFactory.h"

#import "Alipay.h"


@implementation AlipayFactory
{
    XCPayPlatformConfigure *_aliyConfigure;
    Alipay *_alipay;
}

#pragma mark - 📕 👀 PayFactoryProtocol 👀

- (instancetype)initWithPlatformConfigure:(XCPayPlatformConfigure *)configure
{
    if (self = [super init])
    {
        _aliyConfigure = configure;
        _alipay = [[Alipay alloc] initWithConfigure:configure];
    }
    
    return self;
}

- (XCPayPlatformConfigure *)configure
{
    return _aliyConfigure;
}

- (id<XCPayProtocol>)pay
{
    return _alipay;
}

@end
