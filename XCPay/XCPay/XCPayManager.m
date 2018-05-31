//
//  PayManager.m
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/3.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：支付的管理类 🐾
 */

#import "XCPayManager.h"


@interface XCPayManager ()

@property (strong, nonatomic) NSArray<XCPayPlatformConfigure *> *configures;
@property (strong, nonatomic) NSArray *payFactorys;

@end


@implementation XCPayManager


/**
 *  配置支付相关的参数（在AppDelegate配置）
 *
 *  @param activePlatforms  支付平台(@[@(XCPayPlatformTypeAliy)、@(XCPayPlatformTypeWeXin)])
 *  @param configure        配置
 */
+ (void)configurePayActivePlatforms:(NSArray<NSNumber *> *)activePlatforms
                  platformConfigure:(void(^)(XCPayPlatformConfigure *config))configure
{
    XCPayManager *mgr = [XCPayManager sharePayManager];
    
    NSMutableArray *payFactorys   = [NSMutableArray array];
    [activePlatforms enumerateObjectsUsingBlock:^(NSNumber * _Nonnull platformNumber, NSUInteger idx, BOOL * _Nonnull stop) {
        
        XCPayPlatformType platformType = platformNumber.integerValue;
        
        /// 配置支付工厂
        NSString *factoryName = @"AlipayFactory";
        
        switch (platformType)
        {
            case XCPayPlatformTypeAliy:
            {
                factoryName = @"AlipayFactory";
                break;
            }
            case XCPayPlatformTypeWeXin:
            {
                factoryName = @"WXPayFactory";
                break;
            }
        }
        
        /// 配置参数
        XCPayPlatformConfigure *config = [[XCPayPlatformConfigure alloc] initWithPlatformType:platformType];
        if (configure)
        {
            configure(config);
        }
        
        Class factoryClass = NSClassFromString(factoryName);
        id<XCPayFactoryProtocol> factory = [[factoryClass alloc] initWithPlatformConfigure:config];
        [payFactorys addObject:factory];
    }];
    
    mgr.payFactorys = payFactorys;
}


static id _instance = nil;

+ (instancetype)sharePayManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

#pragma mark - 🔓 👀 Public Method 👀

/**
 *  所有支付平台
 */
- (NSArray<id<XCPayFactoryProtocol>> *)allFactorys
{
    return self.payFactorys;
}

/**
 *  根据支付平台类型，返回对应的工厂实例
 */
- (id<XCPayFactoryProtocol>)payFactoryWithPlatformType:(XCPayPlatformType)platformType
{
    if (!self.allFactorys.count)      return NULL;
    
    for (id<XCPayFactoryProtocol> factory in self.allFactorys)
    {
        if (factory.configure.platformType == platformType)
        {
            return factory;
        }
    }
    
    return NULL;
}


@end
