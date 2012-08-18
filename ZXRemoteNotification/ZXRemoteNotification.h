//
//  ZXRemoteNotification.h
//  ZXPush
//
//  Created by 张玺 on 12-8-13.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIResponder (ZXRemoteNotification)

+(void)registerRemote;
+(void)addDevice:(NSData *)token;

@end
