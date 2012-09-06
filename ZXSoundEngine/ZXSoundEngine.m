//
//  ZXSoundEngine.m
//  YiQiWan
//
//  Created by 张 玺 on 12-8-7.
//
//

#import "ZXSoundEngine.h"

@implementation ZXSoundEngine



-(id)init
{
    self = [super init];
    if(self)
    {
        sound = [NSMutableDictionary dictionary];
    }
    return self;
}

static ZXSoundEngine *soundEngine;
+(ZXSoundEngine *)sharedEngine
{
    if(soundEngine == nil)
    {
        soundEngine = [[ZXSoundEngine alloc] init];
    }
    return soundEngine;
}





-(AVAudioPlayer *)prepareSound:(NSString *)fileName withExtension:(NSString *)extention
{
    AVAudioPlayer *player;
    NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:extention];
    player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    
    //player.numberOfLoops = -1;
    [player prepareToPlay];
    [sound setObject:player forKey:[NSString stringWithFormat:@"%@.%@",fileName,extention]];
    return player;
}

-(void)playSound:(NSString *)fileName withExtension:(NSString *)extention
{
    AVAudioPlayer *player = [sound objectForKey:[NSString stringWithFormat:@"%@.%@",fileName,extention]];
    if(player == nil)
        return;
    
    [player play];
}

@end
