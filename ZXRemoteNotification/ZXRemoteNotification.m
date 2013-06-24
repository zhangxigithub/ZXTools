#import "ZXRemoteNotification.h"

@implementation UIResponder (ZXRemoteNotification)

+(void)registerRemote
{
    [[UIApplication sharedApplication]
     registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                         UIRemoteNotificationTypeSound |
                                         UIRemoteNotificationTypeAlert 
                                         )];
}

+(void)addDevice:(NSData *)token
{
    NSString* deviceToken = [[[[token description]
                               stringByReplacingOccurrencesOfString: @"<" withString: @""]
                               stringByReplacingOccurrencesOfString: @">" withString: @""]
                               stringByReplacingOccurrencesOfString: @" " withString: @""];
    
    NSString *oldToken = [[NSUserDefaults standardUserDefaults] objectForKey:@"zxToken"];
    [[NSUserDefaults standardUserDefaults] setObject:deviceToken forKey:@"zxToken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    if(oldToken != nil && [deviceToken isEqualToString:oldToken])
        return;

    

    NSString *address = [NSString stringWithFormat:@"http://zxapi.sinaapp.com/apns/add.php?device=%@&app=%@",deviceToken,[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"]];
    NSURL *url = [NSURL URLWithString:address];
    NSLog(@"send");
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:nil];
    [connection start];
}


- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    [UIResponder addDevice:deviceToken];
}

- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    
    NSLog(@"Error in registration. Error: %@", error);
}


- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    
    // 收到消息自定义事件
     
    NSLog(@"%@",userInfo);
    
    if ([[userInfo objectForKey:@"aps"] objectForKey:@"alert"] != nil) {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"通知"
                                                        message:[[userInfo objectForKey:@"aps"] objectForKey:@"alert"]
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
}

@end
