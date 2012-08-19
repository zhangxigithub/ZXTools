//
//  NSString+ZXTools.h
//  ZXTools
//
//  Created by 张玺 on 12-8-19.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZXTools)

//判断是否是电话号码
- (BOOL)isMobileNumber;
-(BOOL)isEmailAddress;

@end
