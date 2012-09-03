//
//  ZXSegmentController.m
//  ZXSegmentController
//
//  Created by 张玺 on 12-9-2.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "ZXSegmentController.h"

@implementation ZXSegmentController


-(id)initWithBgName:(NSString *)name andTitles:(NSArray *)titles withFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        for(int i = 0;i<titles.count;i++)
        {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            
            NSString *bgName;
            if(i == 0 )                   bgName = [NSString stringWithFormat:@"%@_Left",name];
            else if(i == titles.count-1 ) bgName = [NSString stringWithFormat:@"%@_Right",name];
            else                          bgName = [NSString stringWithFormat:@"%@_Middle",name];
            
            NSString *bgSelectedName;
            if(i == 0 )                   bgSelectedName = [NSString stringWithFormat:@"%@_Left_Selected",name];
            else if(i == titles.count-1 ) bgSelectedName = [NSString stringWithFormat:@"%@_Right_Selected",name];
            else                          bgSelectedName = [NSString stringWithFormat:@"%@_Middle_Selected",name];
            
            [button setBackgroundImage:[[UIImage imageNamed:bgName] stretchableImageWithLeftCapWidth:kIndexLeft topCapHeight:kIndexTop]
                              forState:UIControlStateNormal];
            
            [button setBackgroundImage:[[UIImage imageNamed:bgSelectedName] stretchableImageWithLeftCapWidth:kIndexLeft topCapHeight:kIndexTop]
                              forState:UIControlStateHighlighted];
            
            [button setTitle:[titles objectAtIndex:i] forState:UIControlStateNormal];
            
            [button setTitleColor:[UIColor redColor]   forState:UIControlStateNormal];
            [button setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
            
            button.frame = CGRectMake(i*frame.size.width/titles.count,
                                      0,
                                      frame.size.width/titles.count,
                                      frame.size.height);
            [self addSubview:button];
            
            
        }
        
        
        
        
        
        
    }
    return self;
}
@end
