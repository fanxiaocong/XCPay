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

#pragma mark - 📕 👀 PayFactoryProtocol 👀

- (id<XCPayProtocol>)pay
{
    return [[Alipay alloc] init];
}

@end
