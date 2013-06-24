#import <Foundation/Foundation.h>

@interface UIResponder (ZXRemoteNotification)

+(void)registerRemote;
+(void)addDevice:(NSData *)token;

@end
