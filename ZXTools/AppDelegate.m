#import "AppDelegate.h"

#import "ViewController.h"
#import "ZXTabBarController.h"
#import "NSURL+ZXURL.h"

#import "NSDate+ZXDate.h"

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    
    
    NSURL *url = [NSURL URLWithString:@"http://zhangxi.me/?name=cc&birth=6.12"];
    
    NSLog(@"%@",[url parameters]);
    NSLog(@"%@",[url parameterForKey:@"name"]);    //cc
    NSLog(@"%@",[url parameterForKey:@"sex"]);     //(null)
    NSLog(@"%@",[url parameterForKey:@"birth"]);   //6.12
    
    
    
    
    
    
    NSDate *date = [NSDate dateWithString:@"2013-04-16 23:14:48" formatter:@"yyyy-MM-dd HH:mm:ss"];    
    
    NSLog(@"%d-%d-%d  %d:%d:%d",[date year],[date month],[date day],[date hour],[date minute],[date second]);
    
    NSLog(@"%@",date);
    NSLog(@"%@",[NSDate dateWithTimeIntervalSince1970:1366092888]);
    
    NSLog(@"%@",[NSDate dateWithYear:2013 month:3 day:1]);
    NSLog(@"%@",[NSDate dateWithYear:2013 month:3 day:1 hour:7 minute:3 second:4]);
    
    NSLog(@"%.0f",[date timeIntervalSince1970]);
    
    NSLog(@"%@",[[NSBundle mainBundle] bundleIdentifier]);
   
    
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

    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    
    

    
    

    ZXTabBarController *tab = [[ZXTabBarController alloc] initWithFrames:@[[NSValue valueWithCGRect:CGRectMake(0, 116, 320/5, 44)],
                                                                           [NSValue valueWithCGRect:CGRectMake(64, 116, 320/5, 44)],
                                                                           [NSValue valueWithCGRect:CGRectMake(192, 116, 320/5, 44)],
                                                                           [NSValue valueWithCGRect:CGRectMake(256, 116, 320/5, 44)]]
                                                                       normal:@"bg1"
                                                                  andSelected:@"bg2"];
    

    tab.viewControllers = @[
    [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil],
    [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil],
    [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil],
    [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil]
    ];
    
    
    
    


    self.window.rootViewController = tab;
    

    [self.window makeKeyAndVisible];
    return YES;
}

@end
