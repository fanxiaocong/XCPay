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

#import "XCPayPlatformXMLParser.h"


/// 微信平台
NSString * const AlipayPlatform = @"Alipay";
/// 支付宝平台
NSString * const WXPayPlatform = @"WXPay";



@implementation XCPayManager

static id _instance = nil;

+ (instancetype)sharePayManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

- (instancetype)init
{
    if (self = [super init])
    {
        XCPayPlatformXMLParser *parser = [[XCPayPlatformXMLParser alloc] init];
        
        NSMutableArray *platforms = [NSMutableArray array];
        for (XCPayPlatform *platform in parser.platforms)
        {
            Class factoryClass = NSClassFromString(platform.factoryName);
            [platforms addObject:[[factoryClass alloc] init]];
        }
        
        _allFactorys = platforms;
    }
    
    return self;
}
#pragma mark - 🔓 👀 Public Method 👀

/**
 *  根据支付平台类型，返回对应的工厂实例
 */
- (id<XCPayFactoryProtocol>)payFactoryWithPlatform:(NSString *)platform
{
    if (!self.allFactorys.count)      return NULL;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"platformName == %@", platform];
    
    return [[self.allFactorys filteredArrayUsingPredicate:predicate] firstObject];
}

@end
