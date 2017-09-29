//
//  PayPlatformXMLParser.m
//  CounectDriving
//
//  Created by 樊小聪 on 2017/9/3.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "XCPayPlatformXMLParser.h"


@implementation XCPayPlatformXMLParser

- (instancetype)init
{
    if (self = [super init])
    {
        /// 设置解析
        [self setupParser];
    }
    
    return self;
}

/**
 *  设置解析
 */
- (void)setupParser
{
    self.platforms = [NSMutableArray array];
    
    NSString *filePath = [[NSBundle bundleForClass:self.class] pathForResource:@"XCPayConfigure" ofType:@"xml"];
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    NSXMLParser *parser = [[NSXMLParser alloc] initWithContentsOfURL:fileURL];
    parser.delegate = self;
    [parser parse];
}

#pragma mark - 💉 👀 NSXMLParserDelegate 👀

/**
 *  开始解析
 */
- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    //解析xml
    if([elementName isEqualToString:@"platform"])
    {
        XCPayPlatform *platform = [[XCPayPlatform alloc] init];
        
        platform.Id           = attributeDict[@"id"];
        platform.platformName = attributeDict[@"platformName"];
        platform.factoryName  = attributeDict[@"factoryName"];
        platform.isOpen       = [attributeDict[@"isOpen"] boolValue];
        
        //保存
        [self.platforms addObject:platform];
    }
}


@end
