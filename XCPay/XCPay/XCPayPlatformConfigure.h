//
//  XCPayPlatformConfigure.h
//  Pods-XCPayManager_Example
//
//  Created by 樊小聪 on 2017/11/22.
//


/*
 *  备注：支付平台配置 🐾
 */

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger, XCPayPlatformType)
{
    // 支付宝
    XCPayPlatformTypeAliy = 0,
    // 微信
    XCPayPlatformTypeWeXin
};

@interface XCPayPlatformConfigure : NSObject

/** 👀 支付平台 AppKey 👀 */
@property (copy, nonatomic) NSString *appKey;
/** 👀 支付宝支付的 AppScheme 👀 */
@property (copy, nonatomic) NSString *appScheme;
/** 👀 支付平台 👀 */
@property (assign, nonatomic, readonly) XCPayPlatformType platformType;

- (instancetype)initWithPlatformType:(XCPayPlatformType)platformType;

@end
