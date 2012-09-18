//
//  AppDelegate.m
//  ZXTools
//
//  Created by 张玺 on 12-8-18.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "ZXTabBarController.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //BACK(NSLog(@"r"))
    
    void (^sayHello)() = ^{ NSLog(@"hello");};
    
    BACK(sayHello);
    MAIN(^{NSLog(@"main queue");});
    
    
    NSLog(@"%f",[[[UIScreen mainScreen]currentMode]size].width);
    NSLog(@"%f",[[[UIScreen mainScreen]currentMode]size].height);
    
    if(iPhone5)
    {
        NSLog(@"iphone 5");
    }
    if(isRetina)
    {
        NSLog(@"retina\nretina\nretina\nretina\nretina\nretina\nretina\nretina\n");
    }
    

    [ZXApplication showInfo];

    location = [[ZXLocationManager alloc] init];
    [location locationInfoWithPlacemark:YES];
    
    [location locate:^(CLLocation *locationInfo) {
        NSLog(@"location : %@ \n",locationInfo);
    } mark:^(MKPlacemark *placemark) {
        NSLog(@"placemark : %@ \n",placemark);
    }];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    
    
    //UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    
//    ZXTabBarController *tab = [[ZXTabBarController alloc] initWithButtonCount:5
//                                                                       normal:@"bg1"
//                                                                  andSelected:@"bg2"
//                                                                    withFrame:CGRectMake(0, 300, 320, 20)];
    
    

    ZXTabBarController *tab = [[ZXTabBarController alloc] initWithFrames:@[[NSValue valueWithCGRect:CGRectMake(0, 416, 320/5, 44)],
                                                                           [NSValue valueWithCGRect:CGRectMake(64, 416, 320/5, 44)],
                                                                           [NSValue valueWithCGRect:CGRectMake(192, 416, 320/5, 44)],
                                                                           [NSValue valueWithCGRect:CGRectMake(256, 416, 320/5, 44)]]
                                                                       normal:@"bg1"
                                                                  andSelected:@"bg2"];
    

    tab.viewControllers = @[
    [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil],
    [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil],
    [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil],
    [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil]
    ];
    
    
    

    

    self.window.rootViewController = tab;
    
    //self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
