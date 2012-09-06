//
//  AppDelegate.h
//  ZXTools
//
//  Created by 张玺 on 12-8-18.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXApplication.h"
#import "ZXTools.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,ZXLocationManagerDelegate>
{
    ZXLocationManager *location;

}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
