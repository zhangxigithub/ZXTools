//
//  ZXTabBarController.m
//  ZXTools
//
//  Created by 张 玺 on 12-8-29.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "ZXTabBarController.h"

@implementation ZXTabBarController

-(id)initWithButtonCount:(int)count
                  normal:(NSString *)normalButton
             andSelected:(NSString *)selectedButton
               withFrame:(CGRect)frame
{
    self = [super init];
    if(self)
    {
        buttons = [NSMutableArray array];
        [self hideRealTabBar];
        [self createNewTabBar:normalButton
                  andSelected:selectedButton
                    withFrame:frame
                     andCount:count];
        
    }
    return self;
}
-(id)initWithItems:(NSArray *)items
{
    self = [super init];
    if(self)
    {
        buttons = [NSMutableArray array];
        [self hideRealTabBar];
        int i  = 0;
        for(NSDictionary *value in items)
        {
            
            CGRect buttonFrame = [[value objectForKey:kTabItemFrame] CGRectValue];
            UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom] ;
            button.tag = i;
            button.frame = buttonFrame;
            
            [self.view addSubview:button];
            
            [button setImage:[UIImage imageNamed:[value objectForKey:kTabItemNormal]]
                    forState:UIControlStateNormal];
            
            [button setImage:[UIImage imageNamed:[value objectForKey:kTabItemSelected]]
                    forState:UIControlStateSelected];
            
            [button addTarget:self
                       action:@selector(selectItem:)
             forControlEvents:UIControlEventTouchUpInside];
            [buttons addObject:button];
            i++;
        }
        
        UIButton *button = [buttons objectAtIndex:0];
        button.selected = YES;
    }
    return self;
}



-(id)initWithFrames:(NSArray *)frames
             normal:(NSString *)normalButton
        andSelected:(NSString *)selectedButton
{
    self = [super init];
    if(self)
    {
        buttons = [NSMutableArray array];
        [self hideRealTabBar];
        int i  = 0;
        for(NSValue *value in frames)
        {
            
            CGRect buttonFrame = [value CGRectValue];
            UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom] ;
            button.tag = i;
            button.frame = buttonFrame;
            
            [self.view addSubview:button];
            
            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:normalButton,i]]
                    forState:UIControlStateNormal];
            [button setImage:[UIImage imageNamed:[NSString stringWithFormat:selectedButton,i]]
                    forState:UIControlStateSelected];
            
            [button addTarget:self
                       action:@selector(selectItem:)
             forControlEvents:UIControlEventTouchUpInside];
            [buttons addObject:button];
            i++;
        }
        
        UIButton *button = [buttons objectAtIndex:0];
        button.selected = YES;
    }
    return self;
}


- (void)hideRealTabBar{
    
    for(UIView *view in self.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]]){
            view.hidden = YES;
        }
        if([view isKindOfClass:[UITabBar class]] == NO &&
           [view isKindOfClass:[UIButton class]] == NO)
        {
            view.frame = CGRectMake(0, 0, 320, kScreen_Height);
        }
        
    }
}

-(void)createNewTabBar:(NSString *)normalButton
           andSelected:(NSString *)selectedButton
             withFrame:(CGRect)frame
              andCount:(int)count
{
    
    float width = frame.size.width/count;
    
    
    for(int i = 0;i<count;i++)
    {
        UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom] ;
        button.tag = i;
        button.frame = CGRectMake(frame.origin.x + width*i,
                                  frame.origin.y,
                                  width,
                                  frame.size.height);
        [self.view addSubview:button];
        
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:normalButton,i]]
                forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:[NSString stringWithFormat:selectedButton,i]]
                forState:UIControlStateSelected];
        
        [button addTarget:self
                   action:@selector(selectItem:)
         forControlEvents:UIControlEventTouchUpInside];
        [buttons addObject:button];
    }
    
    UIButton *button = [buttons objectAtIndex:0];
    button.selected = YES;
}


- (void)selectItem:(id)sender {
    UIButton *button = (UIButton *)sender;
    
    for(int i = 0 ;i<self.viewControllers.count;i++)
    {
        UIButton *btn = [buttons objectAtIndex:i];
        if(button.tag != i)
            btn.selected = NO;
        else
            btn.selected = YES;
    }
    
    
    self.currentSelextedIndex = button.tag;
    self.selectedIndex = button.tag;
}

+(NSDictionary *)itemWithFrame:(CGRect)frame normalStatus:(NSString *)normal selectedStatus:(NSString *)selected
{
    return @{
kTabItemFrame:[NSValue valueWithCGRect:frame],
kTabItemNormal:normal,
kTabItemSelected:selected
    };
}

@end
