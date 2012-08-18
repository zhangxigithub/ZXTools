//
//  ZXRate.m
//  ZXRate
//
//  Created by 张 玺 on 12-8-2.
//  Copyright (c) 2012年 zhangxi.me. All rights reserved.
//

#import "ZXRate.h"

@implementation ZXRate

static ZXRate *zxRate;
static NSString *app;

+(void)rateApp:(NSString *)appId atTimes:(int)number
{
    if(zxRate == nil)
    {
        zxRate = [[ZXRate alloc] init];
    }
    app = appId;
    [zxRate check:number];
}


-(void)check:(int)number
{
    NSNumber *time = [[NSUserDefaults standardUserDefaults] objectForKey:@"zxRateTimes"];
    
    int timeLeft;
    
    if(time == nil)
        timeLeft = number;
    else
        timeLeft = [time intValue];
    
    
    if(timeLeft >0)
        timeLeft --;
    else if(timeLeft == 0)
    {
        timeLeft = -1;
        
        NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                        message:[NSString stringWithFormat:@"喜欢%@么,去评价一下吧",appName]
                                                       delegate:zxRate
                                              cancelButtonTitle:@"不了"
                                              otherButtonTitles:@"下次提醒我",@"去评价", nil];
        alert.delegate = self;
        [alert show];
    }
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:timeLeft] forKey:@"zxRateTimes"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 1:
            [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithInt:0] forKey:@"zxRateTimes"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            break;
        case 2:
        {
            NSString *str = [NSString stringWithFormat: @"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",app];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
        }
            break;
        default:
            break;
    }
}


@end
