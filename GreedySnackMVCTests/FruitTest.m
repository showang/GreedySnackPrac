//
//  FruitTest.m
//  GreedySnackMVC
//
//  Created by William Wang on 2017/8/24.
//  Copyright © 2017年 William Wang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Fruit.h"

@interface FruitTest : XCTestCase

@end

@implementation FruitTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHit {
    CGPoint point = CGPointMake(30, 30);
    Fruit* fruit = [[Fruit alloc] initFruit:point radius:5];

    XCTAssertTrue([fruit isHit:CGPointMake(25, 30) radius:5]);
    XCTAssertFalse([fruit isHit:CGPointMake(10, 10) radius:5]);
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
