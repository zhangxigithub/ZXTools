//
//  NSURL+ZXURL.m
//  ZXTools
//
//  Created by zhangxi on 13-6-21.
//  Copyright (c) 2013年 张玺. All rights reserved.
//

#import "NSURL+ZXURL.h"

@implementation NSURL (ZXURL)


-(NSString *)parameterForKey:(NSString *)key
{
    NSDictionary *parameters = [self parameters];
    if(parameters == nil)
        return nil;
    return parameters[key];
}
-(NSDictionary  *)parameters
{
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];

    NSString *query = [self query];
    NSArray *values = [query componentsSeparatedByString:@"&"];

    if(values == nil || values.count == 0)
        return nil;
    
    for(NSString *value in values)
    {
        NSArray *param = [value componentsSeparatedByString:@"="];
        if(param == nil || param.count !=2)
            continue;
        [parameters setObject:param[1] forKey:param[0]];
    }
    return parameters;
}
@end
