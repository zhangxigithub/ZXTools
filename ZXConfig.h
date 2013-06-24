
//在xxxx-Profix.pch中引用


#ifdef DEBUG

#else

#endif

//URL
#define kURL_Localhost [NSURL URLWithString:@"127.0.0.1"]




//App
#define kApp (AppDelegate *)[UIApplication sharedApplication].delegate


//color
#define RGB(r, g, b)             [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a)     [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]



//frame
#define kScreen_Height   ([UIScreen mainScreen].bounds.size.height)
#define kScreen_Width    ([UIScreen mainScreen].bounds.size.width)
#define kScreen_Frame    (CGRectMake(0, 0 ,kScreen_Width,kScreen_Height))
#define kScreen_CenterX  kScreen_Width/2
#define kScreen_CenterY  kScreen_Height/2


#define kContent_Height   ([UIScreen mainScreen].applicationFrame.size.height)
#define kContent_Width    ([UIScreen mainScreen].applicationFrame.size.width)
#define kContent_Frame    (CGRectMake(0, 0 ,kContent_Width,kContent_Height))
#define kContent_CenterX  kContent_Width/2
#define kContent_CenterY  kContent_Height/2

#define kP1 CGPointMake(0                 ,0)
#define kP2 CGPointMake(kContent_Width/2  ,0)
#define kP3 CGPointMake(kContent_Width    ,0)
#define kP4 CGPointMake(0                 ,kContent_Height/2)
#define kP5 CGPointMake(kContent_Width/2  ,kContent_Height/2)
#define kP6 CGPointMake(kContent_Width    ,kContent_Height/2)
#define kP7 CGPointMake(0                 ,kContent_Height)
#define kP8 CGPointMake(kContent_Width/2  ,kContent_Height)
#define kP9 CGPointMake(kContent_Width    ,kContent_Height)

//*********************************************



//release屏蔽NSLog
#ifdef DEBUG


#else
#define NSLog(...) {};
#endif



//GCD
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)


//Device
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define isPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define canTel                 ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel:"]])
#define tel(phoneNumber)       ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNumber]]])
#define telprompt(phoneNumber) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@",phoneNumber]]])

#define canOpenApp(appScheme) ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:appScheme]])
#define openApp(appScheme) ([[UIApplication sharedApplication] openURL:[NSURL URLWithString:appScheme]])






#if TARGET_OS_IPHONE

#endif

#if TARGET_IPHONE_SIMULATOR

#endif



#if __has_feature(objc_arc)

#else

#endif