#import <UIKit/UIKit.h>
#import "ZXTools.h"
#import "ZXNavigationBar.h"
#import "ZXSegmentController.h"


@interface ViewController : UIViewController<ZXSegmentControllerDelegate>
- (IBAction)push:(id)sender;
@property (unsafe_unretained, nonatomic) IBOutlet UILabel *lable;

@end
