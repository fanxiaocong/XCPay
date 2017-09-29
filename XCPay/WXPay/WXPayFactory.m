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

#pragma mark - 📕 👀 XCPayFactoryProtocol 👀

- (id<XCPayProtocol>)pay
{
    return [[WXPay alloc] init];
}

@end
