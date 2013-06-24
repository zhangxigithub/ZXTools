#import <UIKit/UIKit.h>
#import "ZXApplication.h"
#import "ZXTools.h"
#import "ZXLocationManager.h"
@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate,ZXLocationManagerDelegate>
{
    ZXLocationManager *location;

}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@end
