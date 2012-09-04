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


@end
