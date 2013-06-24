#import <UIKit/UIKit.h>

@protocol ZXTableViewDelegate

-(UIView *)loadingView;
-(UIView *)loadedView;

@end

@interface ZXTableView : UITableView

@property(nonatomic,assign) NSInteger count;
@property(nonatomic,unsafe_unretained) id<ZXTableViewDelegate> loadDelegate;


-(void)startLoad;
-(void)finishLoad;

@end
