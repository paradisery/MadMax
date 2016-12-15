//
//  RootViewController.h
//  MadMax+
//
//  Created by ruany on 2016/12/1.
//  Copyright © 2016年 ruany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController :UIViewController

- (instancetype)initWithLeftViewController:(UIViewController *)leftVC
                  withCenterViewController:(UIViewController *)centerVC;



- (void)closeLeftViewController:(UIViewController *)parentViewController;

@end
