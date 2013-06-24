#import <UIKit/UIKit.h>
@class ZXSegmentController;


@protocol ZXSegmentControllerDelegate

-(void)segment:(ZXSegmentController *)segment didSelected:(int)index;

@end



@interface ZXSegmentController : UIView
{
    NSMutableArray *buttons;
}
@property(nonatomic,unsafe_unretained) id<ZXSegmentControllerDelegate> delegate;
@property(nonatomic,strong) UIColor *titleColorNormal;
@property(nonatomic,strong) UIColor *titleColorSlected;
@property(nonatomic,strong) UIColor *titleColorHighlight;


-(id)initWithBgName:(NSString *)name andTitles:(NSArray *)titles withFrame:(CGRect)frame;

@end
