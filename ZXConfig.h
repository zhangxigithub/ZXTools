//项目的基本配置
//在xxxx-Profix.pch中引用
#ifdef DEBUG

#else

#endif












//App
#define kApp (AppDelegate *)[UIApplication sharedApplication].delegate


//URL
#define kURL_Localhost [NSURL URLWithString:@"127.0.0.1"]



//color
#define kColor_Red [UIColor redColor]
#define kColor_Text [UIColor colorWithRed:0.776 green:0.447 blue:0.262 alpha:1]



//frame
#define kFrame_Zero CGRectMake(0, 0, 0, 0)




//frame
#define kFrame_Zero CGRectMake(0, 0, 0, 0)

#define kScreen_Height ([[UIScreen mainScreen] currentMode].size.height/[[UIScreen mainScreen] scale])
#define kScreen_Width  ([[UIScreen mainScreen] currentMode].size.width/[[UIScreen mainScreen] scale])
#define kScreen_Frame (CGRectMake(0, 0 ,kScreen_Width,kScreen_Height))


#define kContent_Height ([[UIScreen mainScreen] currentMode].size.height/[[UIScreen mainScreen] scale] - 20)
#define kContent_Width  ([[UIScreen mainScreen] currentMode].size.width/[[UIScreen mainScreen] scale])
#define kContent_Frame (CGRectMake(0, 0 ,kContent_Width,kContent_Height))



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

//区分模拟器和真机

#if TARGET_OS_IPHONE
//iPhone Device
#endif

#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif


//ARC
#if __has_feature(objc_arc)
    //compiling with ARC
#else
    // compiling without ARC
#endif