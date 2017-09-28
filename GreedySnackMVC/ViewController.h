//
//  ViewController.h
//  GreedySnackMVC
//
//  Created by William Wang on 2017/8/22.
//  Copyright © 2017年 William Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameView.h"

@interface ViewController : UIViewController <GameViewDelegate>

@property (strong, nonatomic) IBOutlet GameView* gameView;

@end

