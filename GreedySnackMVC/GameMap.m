//
//  GameMap.m
//  GreddySnackPrac
//
//  Created by William Wang on 2017/8/21.
//  Copyright © 2017年 William Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdlib.h>
#import "GameMap.h"
#import "GreedySnack.h"

@interface GameMap()
{

}

@property (nonatomic, readwrite) Fruit* fruit;
@property (nonatomic, readwrite) GreedySnack* snack;
@property (nonatomic, readwrite) CGRect mapRect;
@end

@implementation GameMap

CGFloat DEFAULT_MAP_SIZE = 300;

CGFloat START_ANGLE = 0;
CGFloat START_X = 50;
CGFloat START_Y = 50;
CGFloat DEFAULT_RADIUS = 6;

int START_LENGTH = 3;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.mapRect = CGRectMake(0, 0, DEFAULT_MAP_SIZE, DEFAULT_MAP_SIZE);
        self.snack = [[GreedySnack alloc] initWithMap:self length:START_LENGTH];
        [self eatFruit];
    }
        return self;
}

- (instancetype) initWithRect: (CGRect)rect{
    self = [self init];
    self.mapRect = rect;
    return self;
}


-(BOOL) isTouchFruit: (GreedySnack*) snack{
    SnackNode* node =snack.nodeQueue.lastObject;
    return [self.fruit isHit:node.point radius:node.radius];
}

-(BOOL) isOutOfMap:(CGPoint)point{
    return point.x < 0 || point.x > self.mapRect.size.width || point.y < 0 || point.y > self.mapRect.size.height;
}

-(CGPoint) startPoint{
    return CGPointMake(START_X,START_Y);
}

-(CGFloat) startAngle{
    return START_ANGLE;
}

-(CGFloat) defaultRadius{
    return DEFAULT_RADIUS;
}



-(void) eatFruit{
    self.fruit = nil;
    while (self.fruit == nil){
        CGFloat x = arc4random() % ((int)self.mapRect.size.width);
        CGFloat y = arc4random() % ((int)self.mapRect.size.height);
        CGPoint newFruitPoint = CGPointMake(x, y);
        if(![self.snack isHit: newFruitPoint]){
            self.fruit = [[Fruit alloc]initFruit:newFruitPoint radius:DEFAULT_RADIUS];
        }
    }
}

@end
