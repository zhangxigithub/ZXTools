#import <Foundation/Foundation.h>

@interface NSString (ZXString)

//判断是否是电话号码
- (BOOL)isMobileNumber;
-(BOOL)isEmailAddress;

@end
