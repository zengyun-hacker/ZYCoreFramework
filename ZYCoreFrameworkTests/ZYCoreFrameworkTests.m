//
//  ZYCoreFrameworkTests.m
//  ZYCoreFrameworkTests
//
//  Created by dreamer on 14-7-2.
//  Copyright (c) 2014年 SnowWolf. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ZYCoreFrameworkTests : XCTestCase

@end

@implementation ZYCoreFrameworkTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
