//
//  GreddySnack.h
//  GreddySnackPrac
//
//  Created by William Wang on 2017/8/21.
//  Copyright © 2017年 William Wang. All rights reserved.
//

#include <UIKit/UIKit.h>

@class GameMap;
@class SnackNode;

@interface GreedySnack : NSObject

-(instancetype) initWithMap:(GameMap*) map length: (int)length;

-(void) move:(float)angle error:(NSError**) gameOverError;

-(BOOL) isHit:(CGPoint) point;

@property (nonatomic, readonly) GameMap* gameMap;

@property (nonatomic, readonly) NSArray <SnackNode *> * nodeQueue;

@end



