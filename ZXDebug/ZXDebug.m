#import "ZXDebug.h"

@implementation ZXDebug

+(void)poImage:(UIImage *)image
{
    CGRect frame = [UIApplication sharedApplication].keyWindow.window.frame;
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.contentMode = UIViewContentModeCenter;
    imageView.image = image;
    
    [[UIApplication sharedApplication].keyWindow.window addSubview:imageView];
    
}

@end
