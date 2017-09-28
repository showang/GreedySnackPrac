//
//  Fruit.h
//  GreddySnackPrac
//
//  Created by William Wang on 2017/8/21.
//  Copyright © 2017年 William Wang. All rights reserved.
//

#ifndef Fruit_h
#define Fruit_h


#endif /* Fruit_h */

#include <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "SnackNode.h"

@interface Fruit: NSObject

@property (nonatomic, readwrite) NSInteger radius;
@property (nonatomic, readwrite) CGPoint point;

-(instancetype) initFruit: (CGPoint) point radius: (NSInteger) radius;

-(BOOL) isHit: (CGPoint) point radius: (CGFloat)radius;

@end
