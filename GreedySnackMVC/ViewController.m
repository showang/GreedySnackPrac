//
//  ViewController.m
//  GreedySnackMVC
//
//  Created by William Wang on 2017/8/22.
//  Copyright © 2017年 William Wang. All rights reserved.
//

#import "ViewController.h"
#import "GameMap.h"
#import "GreedySnack.h"

@interface ViewController () {
    GameMap *gameMap;
}
@end

@implementation ViewController

CGFloat currentAngle = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.gameView = [[GameView alloc] initWithFrame:self.view.bounds];
//    [self.view addSubview:self.gameView];
    
    gameMap = [[GameMap alloc] initWithRect:self.gameView.bounds];
    self.gameView.delegate = self;
    
//    UITapGestureRecognizer *singleFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
//    [self.gameView addGestureRecognizer:singleFingerTap];
    
    NSTimer *t = [NSTimer scheduledTimerWithTimeInterval: 0.5
                                                  target: self
                                                selector:@selector(onTick:)
                                                userInfo: nil repeats:YES];
    NSRunLoop *runner = [NSRunLoop currentRunLoop];
    [runner addTimer:t forMode: NSDefaultRunLoopMode];
}

-(void)onTick:(NSTimer *)timer {
    NSError* gameOverError;
    [gameMap.snack move:currentAngle error: &gameOverError];
    [self.gameView setNeedsDisplay];
}

-(void) handleSingleTap: (UITapGestureRecognizer *)recognizer{
    CGPoint touchPoint =[recognizer locationInView:[recognizer.view superview]];
    [self touchView:touchPoint];
}

-(void) touchView:(CGPoint) touchPoint{
    SnackNode* node = gameMap.snack.nodeQueue.lastObject;
    currentAngle = [self pointPairToBearingDegrees:node.point secondPoint:touchPoint];
}

- (CGFloat) pointPairToBearingDegrees:(CGPoint)startingPoint secondPoint:(CGPoint) endingPoint
{
    CGPoint originPoint = CGPointMake(endingPoint.x - startingPoint.x, endingPoint.y - startingPoint.y);
    float bearingRadians = atan2f(originPoint.y, originPoint.x);
    float bearingDegrees = bearingRadians * (180.0 / M_PI);
    bearingDegrees = (bearingDegrees > 0.0 ? bearingDegrees : (360.0 + bearingDegrees));
    return bearingDegrees;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (GreedySnack *)getSnack {
    return gameMap.snack;
}

- (Fruit *)getFruit {
    return gameMap.fruit;
}


@end
