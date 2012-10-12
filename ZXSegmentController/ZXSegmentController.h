//
//  ZXSegmentController.h
//  ZXSegmentController
//
//  Created by 张玺 on 12-9-2.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

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

-(void)setFont:(UIFont *)font;


-(void)setSelectedIndex:(int)index;
-(id)initWithBgName:(NSString *)name andTitles:(NSArray *)titles withFrame:(CGRect)frame;

@end
