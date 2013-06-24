#import <Foundation/Foundation.h>

@interface NSString (ZXAES)


- (NSString *)AES256EncryptWithKey:(NSString *)key;
- (NSString *)AES256DecryptWithKey:(NSString *)key;

@end
