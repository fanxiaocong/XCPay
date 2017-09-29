//
//  PayPlatform.h
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/3.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCPayPlatform : NSObject

/** 👀 平台 ID 👀 */
@property (copy, nonatomic) NSString *Id;
/** 👀 平台类型 👀 */
@property (copy, nonatomic) NSString *platformName;
/** 👀 工厂名称 👀 */
@property (copy, nonatomic) NSString *factoryName;
/** 👀 是否开启 👀 */
@property (assign, nonatomic) BOOL isOpen;

@end
