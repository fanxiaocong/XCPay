//
//  XCPayPlatformConfigure.m
//  Pods-XCPayManager_Example
//
//  Created by 樊小聪 on 2017/11/22.
//

#import "XCPayPlatformConfigure.h"

@implementation XCPayPlatformConfigure

- (instancetype)initWithPlatformType:(XCPayPlatformType)platformType
{
    if (self = [super init])
    {
        _platformType = platformType;
    }
    
    return self;
}

@end
