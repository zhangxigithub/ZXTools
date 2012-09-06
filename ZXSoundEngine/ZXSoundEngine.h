//
//  ZXSoundEngine.h
//  YiQiWan
//
//  Created by 张 玺 on 12-8-7.
//
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>


@interface ZXSoundEngine : NSObject
{
    NSMutableDictionary *sound;
}




+(ZXSoundEngine *)sharedEngine;

-(AVAudioPlayer  *)prepareSound:(NSString *)fileName
                  withExtension:(NSString *)extention;


-(void)playSound:(NSString *)fileName
   withExtension:(NSString *)extention;


@end
