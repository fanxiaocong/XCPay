//
//  PayManager.h
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/3.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：支付的管理类 🐾
 */

#import <Foundation/Foundation.h>
#import "XCPayFactoryProtocol.h"

/// 微信平台
extern NSString * const AlipayPlatform;
/// 支付宝平台
extern NSString * const WXPayPlatform;


@interface XCPayManager : NSObject

+ (instancetype)sharePayManager;

/** 👀 所有可用的支付平台 👀 */
@property (strong, nonatomic, readonly) NSArray<id<XCPayFactoryProtocol>> *allFactorys;


/**
 *  根据支付平台类型，返回对应的工厂实例
 */
- (id<XCPayFactoryProtocol>)payFactoryWithPlatform:(NSString *)platform;

@end
