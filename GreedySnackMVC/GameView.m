//
// Created by William Wang on 2017/8/22.
// Copyright (c) 2017 William Wang. All rights reserved.
//

#import "GameView.h"
#import "GreedySnack.h"
#import "SnackNode.h"
#import "Fruit.h"

@implementation GameView {
    CAShapeLayer* fruitLayer;
    NSMutableArray* snackNodeArray;
}

- (void)drawRect:(CGRect)rect {
    [self drawSnack:[self.delegate getSnack]];
    [self drawFruit:[self.delegate getFruit]];
}

- (void)drawSnack:(GreedySnack *)snack {
    if(snackNodeArray == nil){
        snackNodeArray = [[NSMutableArray alloc]init];
    } else{
        for (CAShapeLayer* layer in snackNodeArray) {
            [layer removeFromSuperlayer];
        }
        [snackNodeArray removeAllObjects];
    }
    for (SnackNode *node in snack.nodeQueue) {
        CAShapeLayer *circleLayer = [CAShapeLayer layer];
        [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(node.point.x, node.point.y, node.radius*2, node.radius*2)] CGPath]];
        circleLayer.fillColor = [UIColor redColor].CGColor;
        [[self layer] addSublayer:circleLayer];
        [snackNodeArray addObject:circleLayer];
    }
}

- (void)drawFruit:(Fruit *)fruit {
    if(fruitLayer != nil){
        [fruitLayer removeFromSuperlayer];
    }
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    [circleLayer setPath:[[UIBezierPath bezierPathWithOvalInRect:CGRectMake(fruit.point.x, fruit.point.y, fruit.radius*2, fruit.radius*2)] CGPath]];
    circleLayer.fillColor = [UIColor greenColor].CGColor;
    [[self layer] addSublayer:circleLayer];
    fruitLayer = circleLayer;
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.delegate touchView:[touches.allObjects.lastObject locationInView:self]];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate touchView:[touches.allObjects.lastObject locationInView:self]];
}


@end
