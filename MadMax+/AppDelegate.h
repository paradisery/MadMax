//
//  AppDelegate.h
//  MadMax+
//
//  Created by ruany on 2016/12/1.
//  Copyright © 2016年 ruany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDrawerController.h"
#import "MMDrawerVisualState.h"
#import <QuartzCore/QuartzCore.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
@private
    MMDrawerController *drawerController;
}
@property (strong, nonatomic) UIWindow *window;


@end

