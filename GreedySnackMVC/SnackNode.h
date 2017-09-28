//
//  SnackNode.h
//  GreddySnackPrac
//
//  Created by William Wang on 2017/8/21.
//  Copyright © 2017年 William Wang. All rights reserved.
//

#ifndef SnackNode_h
#define SnackNode_h


#endif /* SnackNode_h */

#include <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SnackNode : NSObject

-(instancetype) initBody: (CGPoint)point angle:(CGFloat)angle radius:(NSInteger)radius;

-(instancetype) initHead: (CGPoint)point angle:(CGFloat)angle radius:(NSInteger)radius;

-(CGPoint) nextPoint: (CGFloat) angle;

-(BOOL) isHit: (CGPoint) nextPoint;

@property (nonatomic, readwrite) CGFloat angle;
@property (nonatomic, readwrite) BOOL isHead;
@property (nonatomic, readwrite) NSInteger radius;
@property (nonatomic, readwrite) CGPoint point;

@end

