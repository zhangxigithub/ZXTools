//
//  ZXNavigationBar.m
//  ZXTools
//
//  Created by 张 玺 on 12-8-29.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "ZXNavigationBar.h"

@implementation ZXNavigationBar

-(void)drawRect:(CGRect)rect {
    if(backgroundImage == nil)
        backgroundImage = [UIImage imageNamed:bgName];
    
    [backgroundImage drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
}

@end

@implementation UINavigationBar (LazyNavigationBar)

+ (Class)class {
    return NSClassFromString(@"ZXNavigationBar");
}
@end
