#import "ZXNavigationBar.h"

@implementation ZXNavigationBar

-(void)drawRect:(CGRect)rect {
    if(backgroundImage == nil)
        backgroundImage = [UIImage imageNamed:bgName];
    
    [backgroundImage drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

@end

@implementation UINavigationBar (LazyNavigationBar)

+ (Class)class {
    return NSClassFromString(@"ZXNavigationBar");
}
@end
