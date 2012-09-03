//
//  ViewController.h
//  ZXTools
//
//  Created by 张玺 on 12-8-18.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXTools.h"
#import "ZXNavigationBar.h"
#import "ZXSegmentController.h"


@interface ViewController : UIViewController<ZXSegmentControllerDelegate>
- (IBAction)push:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lable;

@end
