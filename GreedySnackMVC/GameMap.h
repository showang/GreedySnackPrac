//
//  GameMap.h
//  GreddySnackPrac
//
//  Created by William Wang on 2017/8/21.
//  Copyright © 2017年 William Wang. All rights reserved.
//

#ifndef GameMap_h
#define GameMap_h


#endif /* GameMap_h */

#include <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#include "Fruit.h"

@class GreedySnack;

@interface GameMap : NSObject

-(instancetype) initWithRect: (CGRect) rect;

-(BOOL) isTouchFruit: (GreedySnack*) snake;

-(BOOL) isOutOfMap: (CGPoint) point;

-(void) eatFruit;

-(CGPoint) startPoint;

-(CGFloat) startAngle;

-(CGFloat) defaultRadius;


@property (nonatomic, readonly) Fruit* fruit;
@property (nonatomic, readonly) GreedySnack* snack;
@property (nonatomic, readonly) CGRect mapRect;

@end
