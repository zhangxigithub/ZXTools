#import <Foundation/Foundation.h>

@interface NSData (ZXAES)
- (NSData *)AES256EncryptWithKey:(NSString *)key;
- (NSData *)AES256DecryptWithKey:(NSString *)key;
@end
