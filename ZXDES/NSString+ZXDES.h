#import <Foundation/Foundation.h>

@interface NSString (ZXDES)
- (NSString *) DESEncryptByKey:(NSString *)key;
- (NSString *) DESDecryptByKey:(NSString *)key;
@end
