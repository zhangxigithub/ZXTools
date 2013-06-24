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


// [NSDate dateWithString:@"2013-04-16 23:14:48" formatter:@"yyyy-MM-dd HH:mm:ss"]
 
+(NSDate   *)dateWithString:(NSString *)dateString
                  formatter:(NSString *)formatter;


 //[NSDate dateWithYear:2013 month:3 day:1]
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
