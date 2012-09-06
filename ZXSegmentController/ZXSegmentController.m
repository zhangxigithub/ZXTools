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
        
        
        buttons = [NSMutableArray array];
        self.titleColorNormal  = [UIColor blackColor];
        self.titleColorSlected = [UIColor redColor];
        
        
        
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
            
            [button setBackgroundImage:[UIImage imageNamed:bgName] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:bgSelectedName] forState:UIControlStateSelected];
            
            [button setTitle:[titles objectAtIndex:i] forState:UIControlStateNormal];
            
            
            [button setTitleColor:self.titleColorNormal  forState:UIControlStateNormal];
            [button setTitleColor:self.titleColorSlected forState:UIControlStateHighlighted];
            [button setTitleColor:self.titleColorSlected forState:UIControlStateSelected];
            
            
            
            button.frame = CGRectMake(i*frame.size.width/titles.count,
                                      0,
                                      frame.size.width/titles.count,
                                      frame.size.height);
            [button addTarget:self action:@selector(selectButton:) forControlEvents:UIControlEventTouchUpInside];
            
            button.tag = i;
            [buttons addObject:button];
            [self addSubview:button];
        }
        [self selectButton:[buttons objectAtIndex:0]];
}
    return self;
}

-(void)selectButton:(UIButton*)button
{
    for(UIButton *theButton in buttons)
    {
        if(button.tag == theButton.tag)
            button.selected = YES;
        else theButton.selected = NO;
    }
    
    [self.delegate segment:self didSelected:button.tag];
}
-(void)setTitleColorNormal:(UIColor *)titleColorNormal
{
    _titleColorNormal = titleColorNormal;
    [self setTitleColor:titleColorNormal toState:UIControlStateNormal];
}
-(void)setTitleColorSlected:(UIColor *)titleColorSlected
{
    _titleColorSlected = titleColorSlected;
    [self setTitleColor:titleColorSlected toState:UIControlStateSelected];
}
-(void)setTitleColor:(UIColor *)color toState:(UIControlState)state
{
    for(UIButton *theButton in buttons)
    {
        [theButton setTitleColor:color forState:state];
    }
}

@end
