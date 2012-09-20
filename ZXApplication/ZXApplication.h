//
//  ZXApplication.h
//  ZXTools
//
//  Created by 张 玺 on 12-9-4.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <sys/sysctl.h>
@interface ZXApplication : NSObject


+(NSString *)documentPath;
+(NSString *)appVersion;
+(BOOL)isJailBreak;
+(float)iOSVersion;     //返回iOS版本号，整形，例如 3,4,5
+(BOOL)isIpad;
+(BOOL)isIPhone5;
+(NSString *)platform;
+(NSString *)language;
+(void)rate:(NSString *)app;



+(void)showInfo;
@end
