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
#import "XCPayPlatformConfigure.h"



@interface XCPayManager : NSObject

/**
 *  配置支付相关的参数（在AppDelegate配置）
 *
 *  @param activePlatforms  支付平台(@[@(XCPayPlatformTypeAliy)、@(XCPayPlatformTypeWeXin)])
 *  @param configure        配置
 */
+ (void)configurePayActivePlatforms:(NSArray<NSNumber *> *)activePlatforms
                  platformConfigure:(void(^)(XCPayPlatformConfigure *config))configure;


+ (instancetype)sharePayManager;

/** 👀 所有可用的支付平台 👀 */
@property (strong, nonatomic, readonly) NSArray<id<XCPayFactoryProtocol>> *allFactorys;


/**
 *  根据支付平台类型，返回对应的工厂实例
 */
- (id<XCPayFactoryProtocol>)payFactoryWithPlatformType:(XCPayPlatformType)platformType;


@end
