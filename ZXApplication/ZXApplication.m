//
//  ZXApplication.m
//  ZXTools
//
//  Created by 张 玺 on 12-9-4.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "ZXApplication.h"

@implementation ZXApplication

+(NSString *)documentPath
{
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
}
+(NSString *)appVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+(BOOL)isJailBreak
{
    int res = system("ls");
    if (res == 0)
        return YES;
    else
        return NO;
}
+(float)iOSVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}
+(BOOL)isIpad
{
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
}

+(NSString *)language
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSArray *languages = [defaults objectForKey:@"AppleLanguages"];
    return [languages objectAtIndex:0];
}
+(NSString *)platform{
    
    size_t size;
    
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    
    char *machine = malloc(size);
    
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    
    free(machine);
    
    return platform;
}


+(void)showInfo
{
    #ifdef DEBUG
    #else
        return;
    #endif
    
    
    NSLog(@"document:%@",[ZXApplication documentPath]);
    NSLog(@"%@",[ZXApplication isJailBreak]?@"越狱":@"没越狱");
    NSLog(@"app version:%@",[ZXApplication appVersion]);
    NSLog(@"iOS version:%f",[ZXApplication iOSVersion]);
    NSLog(@"is iPad : %@",[ZXApplication isIpad]?@"yes":@"no");
    NSLog(@"language : %@",[ZXApplication language]);
    NSLog(@"platform : %@",[ZXApplication platform]);
    
    NSLog(@"****************************************");
}
@end
