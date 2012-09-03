//
//  ZXSegmentController.h
//  ZXSegmentController
//
//  Created by 张玺 on 12-9-2.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZXSegmentController : UIView
{
    NSMutableArray *buttons;
}
-(id)initWithBgName:(NSString *)name andTitles:(NSArray *)titles withFrame:(CGRect)frame;

@end
