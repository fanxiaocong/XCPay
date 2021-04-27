//
//  WXPayInfoProtocol.h
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/3.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

/*
 *  备注：微信支付订单信息协议 🐾
 */

#import <Foundation/Foundation.h>

@protocol WXPayOrderInfoProtocol <NSObject>

@required
/** 👀 应用ID 👀 */
@property (copy, nonatomic, readonly) NSString *wx_appId;
/** 商家向财付通申请的商家id */
@property (copy, nonatomic, readonly) NSString *wx_partnerId;
/** 预支付订单 */
@property (copy, nonatomic, readonly) NSString *wx_prepayId;
/** 随机串，防重发 */
@property (copy, nonatomic, readonly) NSString *wx_nonceStr;
/** 时间戳，防重发 */
@property (assign, nonatomic, readonly) UInt32 wx_timeStamp;
/** 商家根据财付通文档填写的数据和签名 */
@property (copy, nonatomic, readonly) NSString *wx_package;
/** 商家根据微信开放平台文档对数据做的签名 */
@property (copy, nonatomic, readonly) NSString *wx_sign;

@end
