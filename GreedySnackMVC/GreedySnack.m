//
//  GreddySnack.m
//  GreddySnackPrac
//
//  Created by William Wang on 2017/8/21.
//  Copyright © 2017年 William Wang. All rights reserved.
//

#include <math.h>

#import <Foundation/Foundation.h>
#import "GreedySnack.h"
#import "SnackNode.h"
#import "NSMutableArray+QueueAdditions.h"
#import "GameMap.h"

@interface GreedySnack()
{
    NSMutableArray *nodeQueue;
    
}
@property (nonatomic, readwrite) GameMap* gameMap;
@end

@implementation GreedySnack

-(instancetype) initWithMap:(GameMap *)map length: (int)length{
    self = [super init];
    self.gameMap = map;
    nodeQueue = [[NSMutableArray alloc] init];
    CGPoint startPoint = [self.gameMap startPoint];
    for(int i = 0;i<length-1;i++){
        SnackNode* body = [[SnackNode alloc]initBody:startPoint angle:[map startAngle] radius:[map defaultRadius]];
        [nodeQueue enqueue:body];
    }
    SnackNode* head = [[SnackNode alloc]initHead:[map startPoint] angle:[map startAngle] radius:[map defaultRadius]];
    [nodeQueue enqueue:head];
    return self;
}

-(void) move:(float) angle error:(NSError**) gameOverError {
    SnackNode* firstNode = [self.nodeQueue lastObject];
    float radius = firstNode.radius;
    
    CGPoint nextPoint = [firstNode nextPoint:angle];
    BOOL isHitSelf = [self checkHitSelf:nextPoint];
    BOOL isOutOfMap = [self.gameMap isOutOfMap:nextPoint];
    if(isHitSelf || isOutOfMap){
        *gameOverError = [[NSError alloc] initWithDomain:@"GreddySnackDomain" code:0 userInfo:@{NSLocalizedDescriptionKey:@"Game over"}];
        return;
    }
    
    SnackNode* newHead = [[SnackNode alloc] initHead:nextPoint angle:angle radius:radius];
    [firstNode setIsHead:false];
    [nodeQueue enqueue:newHead];
    
    if(![self.gameMap isTouchFruit:self]){
        [nodeQueue dequeue];
    }else{
        [self.gameMap eatFruit];
    }
    
}

-(BOOL) checkHitSelf:(CGPoint) nextPoint{
    for(NSInteger i=0; i < self.nodeQueue.count; i++ ){
        SnackNode* bodyNode = [self.nodeQueue objectAtIndex:i];
        if([bodyNode isHit:nextPoint]){
            return true;
        }
    }
    return false;
}

-(BOOL) isHit:(CGPoint)point{
    return [self checkHitSelf:point];
}

@synthesize nodeQueue = nodeQueue;

@end
