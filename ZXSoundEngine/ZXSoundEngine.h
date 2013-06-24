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
