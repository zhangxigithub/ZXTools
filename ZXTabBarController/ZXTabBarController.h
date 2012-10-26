//
//  ZXTabBarController.h
//  ZXTools
//
//  Created by 张 玺 on 12-8-29.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#define kTabItemFrame     @"zxTabFrame"
#define kTabItemNormal    @"zxTabNormal"
#define kTabItemSelected  @"zxTabSelected"


#import <UIKit/UIKit.h>

@interface ZXTabBarController : UITabBarController
{
    NSMutableArray *buttons;
}

@property(nonatomic,assign) int currentSelextedIndex;


//推荐使用
-(id)initWithItems:(NSArray *)items;




//制定数量，自动排列
-(id)initWithButtonCount:(int)count
                  normal:(NSString *)normalButton
             andSelected:(NSString *)selectedButton
               withFrame:(CGRect)frame;



//CGRect->NSValue->NSArray
//指定位置
-(id)initWithFrames:(NSArray *)frames
             normal:(NSString *)normalButton
        andSelected:(NSString *)selectedButton;


+(NSDictionary *)itemWithFrame:(CGRect)frame normalStatus:(NSString *)normal selectedStatus:(NSString *)selected;

@end
