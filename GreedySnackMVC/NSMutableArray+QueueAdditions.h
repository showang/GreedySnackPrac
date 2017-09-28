//
//  NSMutableArray.h
//  GreddySnackPrac
//
//  Created by William Wang on 2017/8/21.
//  Copyright © 2017年 William Wang. All rights reserved.
//

#ifndef NSMutableArray_h
#define NSMutableArray_h


#endif /* NSMutableArray_h */

@interface NSMutableArray (QueueAdditions)
- (id) dequeue;
- (void) enqueue:(id)obj;
@end
