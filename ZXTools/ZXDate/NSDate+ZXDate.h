#import <Foundation/Foundation.h>

@interface NSDate (ZXDate)


-(int)year;
-(int)month;
-(int)day;

-(int)hour;
-(int)minute;
-(int)second;




// 格式化的字符串
 
-(NSString *)stringWithFormatter:(NSString *)formatter;



 
+(NSDate   *)dateWithString:(NSString *)dateString
                  formatter:(NSString *)formatter;



+(NSDate   *)dateWithYear:(int)year
                    month:(int)month
                      day:(int)day;

+(NSDate   *)dateWithYear:(int)year
                    month:(int)month
                      day:(int)day
                     hour:(int)hour
                   minute:(int)minute
                   second:(int)second;

@end
