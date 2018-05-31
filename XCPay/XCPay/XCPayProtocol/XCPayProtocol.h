//
//  PayProtocol.h
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/3.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：支付相关的协议 🐾
 */

#import "XCPayAppDelegateProtocol.h"
#import "XCPayPlatformConfigure.h"


/**
 *  支付结果的状态
 */
typedef NS_ENUM(NSInteger, XCPayResultStatus)
{
    /// 支付成功
    XCPayResultStatusSuccess = 0,
    
    /// 支付失败
    XCPayResultStatusFailure,
    
    /// 正在处理中
    XCPayResultStatusWaiting,
    
    /// 已取消支付
    XCPayResultStatusCancel,
    
    /// 网络连接出错
    XCPayResultStatusNetworkError,
};


@protocol XCPayProtocol <XCPayAppDelegateProtocol>

@required
- (instancetype)initWithConfigure:(XCPayPlatformConfigure *)configure;
/**
 *  开始支付
 *
 *  @param orderInfo        订单信息
 *  @param completeHandle   当支付完成的回调
 */
- (void)payWithOrderInfo:(id)orderInfo
          completeHandle:(void(^)(XCPayResultStatus resultStatus))completeHandle;

@end
