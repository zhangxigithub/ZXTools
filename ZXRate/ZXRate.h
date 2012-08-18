//
//  ZXRate.h
//  ZXRate
//
//  Created by 张 玺 on 12-8-2.
//  Copyright (c) 2012年 zhangxi.me. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXRate : NSObject<UIAlertViewDelegate>

/*
 appId:itunes connect添加应用后的app id
 number:再第几次之后提示评价，0为第一次打开就提示评价
 */
+(void)rateApp:(NSString *)appId atTimes:(int)number;
@end
