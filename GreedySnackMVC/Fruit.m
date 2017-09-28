//
//  Fruit.m
//  GreddySnackPrac
//
//  Created by William Wang on 2017/8/21.
//  Copyright © 2017年 William Wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "Fruit.h"

@implementation Fruit

-(instancetype) initFruit: (CGPoint) point radius:(NSInteger) radius{
    self = [super init];
    self.point = point;
    self.radius = radius;
    return self;
}

-(BOOL) isHit: (CGPoint) point radius: (CGFloat)radius{
    CGFloat disX = self.point.x - point.x;
    CGFloat disY = self.point.y - point.y;
    float distance = sqrtf(pow(disX, 2) + pow(disY, 2));
    return distance <= self.radius + radius;
}

@end
