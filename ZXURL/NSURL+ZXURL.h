//
//  NSURL+ZXURL.h
//  ZXTools
//
//  Created by zhangxi on 13-6-21.
//  Copyright (c) 2013年 张玺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURL (ZXURL)


-(NSString *)parameterForKey:(NSString *)key;
-(NSDictionary  *)parameters;

@end
