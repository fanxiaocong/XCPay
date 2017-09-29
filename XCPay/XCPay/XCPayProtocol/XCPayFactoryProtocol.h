//
//  PayFactoryProtocol.h
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/3.
//  Copyright © 2017年 樊小聪. All rights reserved.
//


/*
 *  备注：支付工厂协议 🐾
 */

#import "XCPayProtocol.h"

@protocol XCPayFactoryProtocol <NSObject>

@required
/**
 *  返回具体的支付实例对象
 */
@property (strong, nonatomic, readonly) id<XCPayProtocol> pay;

@end
