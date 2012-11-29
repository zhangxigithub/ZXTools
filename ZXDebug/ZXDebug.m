//
//  ZXDebug.m
//  ZXTools
//
//  Created by 张 玺 on 12-11-2.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "ZXDebug.h"

@implementation ZXDebug

+(void)poImage:(UIImage *)image
{
    CGRect frame = [UIApplication sharedApplication].keyWindow.window.frame;
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.contentMode = UIViewContentModeCenter;
    imageView.image = image;
    
    [[UIApplication sharedApplication].keyWindow.window addSubview:imageView];
    
}

@end
