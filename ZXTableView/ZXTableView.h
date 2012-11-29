//
//  ZXTableView.h
//  ZXTools
//
//  Created by 张 玺 on 12-11-29.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

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
