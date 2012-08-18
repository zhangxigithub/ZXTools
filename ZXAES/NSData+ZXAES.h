//
//  NSData+ZXAES.h
//  ZXTools
//
//  Created by 张玺 on 12-8-18.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ZXAES)
- (NSData *)AES256EncryptWithKey:(NSString *)key;
- (NSData *)AES256DecryptWithKey:(NSString *)key;
@end
