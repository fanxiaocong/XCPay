#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "Alipay.h"
#import "AlipayFactory.h"
#import "WXPay.h"
#import "WXPayFactory.h"
#import "WXPayOrderInfoProtocol.h"
#import "XCPayAppDelegate.h"
#import "XCPayManager.h"
#import "XCPayPlatformConfigure.h"
#import "XCPayAppDelegateProtocol.h"
#import "XCPayFactoryProtocol.h"
#import "XCPayProtocol.h"

FOUNDATION_EXPORT double XCPayVersionNumber;
FOUNDATION_EXPORT const unsigned char XCPayVersionString[];

