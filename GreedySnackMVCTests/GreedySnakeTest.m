//
//
//  GreedySnackMVC
//
//  Created by William Wang on 2017/8/23.
//  Copyright © 2017年 William Wang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GameMap.h"
#import "SnackNode.h"
#import "GreedySnack.h"
#import "OCMock/OCMock.h"
//@import OCMock;

@interface GreedySnakeTest : XCTestCase

@end

@implementation GreedySnakeTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSnakeInit {
    GameMap *gameMap = [[GameMap alloc] init];

    CGPoint mockStartPoint = CGPointMake(87, 78);
    id mockMap = [OCMockObject partialMockForObject:gameMap];
    OCMStub([mockMap defaultRadius]).andReturn(10);
    OCMStub([mockMap startPoint]).andReturn(mockStartPoint);
    OCMStub([mockMap startAngle]).andReturn(17);

    GreedySnack *snake = [[GreedySnack alloc] initWithMap:mockMap length:10];

    XCTAssertTrue([snake.nodeQueue count] == 10);
    XCTAssertEqual([snake.nodeQueue lastObject].point.x, mockStartPoint.x);
    XCTAssertEqual([snake.nodeQueue lastObject].point.y, mockStartPoint.y);
}

-(void) testSnackMove {
    GameMap *gameMap = [[GameMap alloc] init];
    CGPoint mockStartPoint = CGPointMake(10, 10);
    CGPoint exceptMovePoint = CGPointMake(20, 10);
    
    id mockMap = [OCMockObject partialMockForObject:gameMap];
    OCMStub([mockMap defaultRadius]).andReturn(5);
    OCMStub([mockMap startPoint]).andReturn(mockStartPoint);
    OCMStub([mockMap startAngle]).andReturn(0);
    OCMStub([mockMap isOutOfMap:exceptMovePoint]).andReturn(false);
    
    
    GreedySnack *snake = [[GreedySnack alloc] initWithMap:mockMap length:10];
    
    OCMStub([mockMap isTouchFruit:snake]).andReturn(false);
    [[mockMap expect] eatFruit];
    
    NSError *gameOverError;
    [snake move:0 error:&gameOverError];
    
    XCTAssertNil(gameOverError);
}

-(void) testSnackMove_eatFruit {
    GameMap *gameMap = [[GameMap alloc] init];
    CGPoint mockStartPoint = CGPointMake(10, 10);
    CGPoint exceptMovePoint = CGPointMake(20, 10);
    
    id mockMap = [OCMockObject partialMockForObject:gameMap];
    OCMStub([mockMap defaultRadius]).andReturn(5);
    OCMStub([mockMap startPoint]).andReturn(mockStartPoint);
    OCMStub([mockMap startAngle]).andReturn(0);
    OCMStub([mockMap isOutOfMap:exceptMovePoint]).andReturn(false);
    
    
    GreedySnack *snake = [[GreedySnack alloc] initWithMap:mockMap length:10];
    
    OCMStub([mockMap isTouchFruit:snake]).andReturn(true);
    [[mockMap expect] eatFruit];
    
    NSError *gameOverError;
    [snake move:0 error:&gameOverError];
    
    XCTAssertNil(gameOverError);
    XCTAssertTrue(snake.nodeQueue.count == 11);
    OCMVerifyAll(mockMap);
}

- (void)testSnakeMove_hitMap {
    GameMap *gameMap = [[GameMap alloc] init];
    CGPoint mockStartPoint = CGPointMake(10, 20);
    CGPoint exceptMovePoint = CGPointMake(10, 10);
    
    id mockMap = [OCMockObject partialMockForObject:gameMap];
    OCMStub([mockMap defaultRadius]).andReturn(5);
    OCMStub([mockMap startPoint]).andReturn(mockStartPoint);
    OCMStub([mockMap startAngle]).andReturn(-90);
    OCMStub([mockMap isOutOfMap:exceptMovePoint]).andReturn(true);
    
    GreedySnack *snake = [[GreedySnack alloc] initWithMap:mockMap length:10];
    
    NSError *gameOverError;
    [snake move:-90 error:&gameOverError];
    XCTAssertNotNil(gameOverError);
}

-(void) testSnackMove_hitSelf {
    GameMap *gameMap = [[GameMap alloc] init];
    CGPoint mockStartPoint = CGPointMake(10, 10);
    CGPoint exceptMovePoint = CGPointMake(20, 10);
    
    id mockMap = [OCMockObject partialMockForObject:gameMap];
    OCMStub([mockMap defaultRadius]).andReturn(5);
    OCMStub([mockMap startPoint]).andReturn(mockStartPoint);
    OCMStub([mockMap startAngle]).andReturn(0);
    OCMStub([mockMap isOutOfMap:exceptMovePoint]).andReturn(false);
    
    
    GreedySnack *snake = [[GreedySnack alloc] initWithMap:mockMap length:10];
    
    OCMStub([mockMap isTouchFruit:snake]).andReturn(false);
    
    NSError *gameOverError;
    [snake move:0 error:&gameOverError];
    [snake move:180 error:&gameOverError];
    XCTAssertNotNil(gameOverError);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
