#import "ZXTableView.h"

@implementation ZXTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)startLoad
{
    id obj = _loadDelegate;
    if([obj respondsToSelector:@selector(loadingView)])
    {
        self.tableFooterView = [obj loadingView];
        return;
    }
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    activity.center = view.center;
    [view addSubview:view];
    self.tableFooterView = view;
}
-(void)finishLoad
{
    id obj = _loadDelegate;
    if([obj respondsToSelector:@selector(loadedView)])
    {
        self.tableFooterView = [obj loadedView];
        return;
    }
    self.tableFooterView = nil;
}

@end
