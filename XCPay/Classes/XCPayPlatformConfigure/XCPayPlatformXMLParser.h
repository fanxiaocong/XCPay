//
//  PayPlatformXMLParser.h
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/3.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XCPayPlatform.h"


@interface XCPayPlatformXMLParser : NSObject<NSXMLParserDelegate>

/** 👀 支付平台配置数组 👀 */
@property (strong, nonatomic) NSMutableArray<XCPayPlatform *> *platforms;

@end
