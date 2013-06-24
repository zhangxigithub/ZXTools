#import "NSDate+ZXDate.h"

@implementation NSDate (ZXDate)

-(int)year {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDateComponents *components = [gregorian components:NSYearCalendarUnit fromDate:self];
    [components setTimeZone:[NSTimeZone defaultTimeZone]];
    return [components year];
}


-(int)month {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    NSDateComponents *components = [gregorian components:NSMonthCalendarUnit fromDate:self];
    [components setTimeZone:[NSTimeZone defaultTimeZone]];
    return [components month];
}

-(int)day {
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    
    NSDateComponents *components = [gregorian components:NSDayCalendarUnit fromDate:self];

    return [components day];
}
-(int)hour
{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    
    NSDateComponents *components = [gregorian components:NSHourCalendarUnit fromDate:self];
    
    return [components hour];
}
-(int)minute
{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    
    NSDateComponents *components = [gregorian components:NSMinuteCalendarUnit fromDate:self];
    
    return [components minute];
}
-(int)second
{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    
    NSDateComponents *components = [gregorian components:NSSecondCalendarUnit fromDate:self];
    
    return [components second];
}


//格式化的字符串
-(NSString *)stringWithFormatter:(NSString *)formatter
{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setDateFormat:formatter];
    return [f stringFromDate:self];
}
+(NSDate   *)dateWithString:(NSString *)dateString formatter:(NSString *)formatter
{
    NSDateFormatter *f = [[NSDateFormatter alloc] init];
    [f setTimeZone:[NSTimeZone defaultTimeZone]];
    [f setDateFormat:formatter];
    
    NSDate *date = [f dateFromString:dateString];

    return [date dateByAddingTimeInterval:[[NSTimeZone defaultTimeZone] secondsFromGMT]];
}
+(NSDate   *)dateWithYear:(int)year
                    month:(int)month
                      day:(int)day
{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    
    return [gregorian dateFromComponents:components];
}

+(NSDate   *)dateWithYear:(int)year
                    month:(int)month
                      day:(int)day
                     hour:(int)hour
                   minute:(int)minute
                   second:(int)second
{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    [gregorian setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    [components setYear:year];
    [components setMonth:month];
    [components setDay:day];
    [components setHour:hour];
    [components setMinute:minute];
    [components setSecond:second];
    
    return [gregorian dateFromComponents:components];
}

@end
