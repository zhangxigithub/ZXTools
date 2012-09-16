//项目的基本配置
//在xxxx-Profix.pch中引用



//URL
#define kURL_Localhost [NSURL URLWithString:@"127.0.0.1"]



//color
#define kColor_Red [UIColor redColor]




//frame
#define kFrame_Zero CGRectMake(0, 0, 0, 0)





//*********************************************



//NSLog
#ifdef DEBUG


#else
#define NSLog(...) {};
#endif



//ARC
//*********************************************
//*********************************************
#if __has_feature(objc_arc)
// compiling with ARC
#else
// compiling without ARC
#endif