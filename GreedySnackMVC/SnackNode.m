//
//  SnackNode.m
//  GreddySnackPrac
//
//  Created by William Wang on 2017/8/21.
//  Copyright © 2017年 William Wang. All rights reserved.
//


#import <math.h>
#import "SnackNode.h"

@implementation SnackNode

-(instancetype) initHead:(CGPoint)point angle:(CGFloat)angle radius:(NSInteger)radius{
    self = [super init];
    self.isHead = true;
    self.point = point;
    self.angle = angle;
    self.radius = radius;
    return self;
}

-(instancetype) initBody:(CGPoint)point angle:(CGFloat)angle radius:(NSInteger)radius{
    self = [super init];
    self.isHead = false;
    self.point = point;
    self.angle = angle;
    self.radius = radius;
    return self;
}

-(CGPoint) nextPoint:(CGFloat)angle{
    float nextX = self.radius * 2 * cosf(angle / 180 * M_PI) + self.point.x;
    float nextY = self.radius * 2 * sinf(angle / 180 * M_PI) + self.point.y;
    CGPoint nextPoint = CGPointMake(nextX,nextY);
    return nextPoint;
}

-(BOOL) isHit: (CGPoint) nextPoint{
    CGFloat disX = self.point.x - nextPoint.x;
    CGFloat disY = self.point.y - nextPoint.y;
    float distance = sqrtf(pow(disX, 2) + pow(disY, 2));
    return distance < self.radius * 2 -1;
}

@end
