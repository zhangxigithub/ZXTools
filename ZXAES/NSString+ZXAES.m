#import "NSString+ZXAES.h"
#import "NSData+ZXAES.h"
#import "NSString+Base64.h"

@implementation NSString (ZXAES)


- (NSString *)AES256EncryptWithKey:(NSString *)key
{

   // NSData *data = [self base64DecodedData];
    NSData *encryptData = [[self dataUsingEncoding:NSUTF8StringEncoding] AES256EncryptWithKey:key];

    NSString *str = [[NSString alloc] initWithData:encryptData encoding:NSUTF8StringEncoding];

    return str;
}
- (NSString *)AES256DecryptWithKey:(NSString *)key
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSData *decryptData = [data AES256DecryptWithKey:key];
    
    return [[NSString alloc] initWithData:decryptData encoding:NSUTF8StringEncoding];
}


@end
