//
// Created by William Wang on 2017/8/22.
// Copyright (c) 2017 William Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@class SnackNode;
@class Fruit;
@class GreedySnack;

@protocol GameViewDelegate <NSObject>

-(GreedySnack *)getSnack;
-(Fruit *) getFruit;
-(void) touchView:(CGPoint) touchPoint;

@end

@interface GameView : UIView


@property (nonatomic, weak) id<GameViewDelegate> delegate;

@end
