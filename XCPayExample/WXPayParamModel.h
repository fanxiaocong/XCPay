//
//  WXPayParamModel.h
//  XCPayExample
//
//  Created by 樊小聪 on 2018/5/31.
//  Copyright © 2018年 樊小聪. All rights reserved.
//

/*
 *  备注：微信支付参数模型 🐾
 */

#import <Foundation/Foundation.h>
#import "WXPayOrderInfoProtocol.h"

@interface WXPayParamModel : NSObject<WXPayOrderInfoProtocol>

@property (copy, nonatomic) NSString *appId;
/** 商家向财付通申请的商家id */
@property (nonatomic, copy) NSString *partnerId;
/** 预支付订单 */
@property (nonatomic, copy) NSString *prepayId;
/** 随机串，防重发 */
@property (nonatomic, copy) NSString *nonceStr;
/** 时间戳，防重发 */
@property (nonatomic, assign) UInt32 timeStamp;
/** 商家根据财付通文档填写的数据和签名 */
@property (nonatomic, copy) NSString *packageValue;
/** 商家根据微信开放平台文档对数据做的签名 */
@property (nonatomic, copy) NSString *sign;

@end
