//
//  ViewController.m
//  ZXTools
//
//  Created by 张玺 on 12-8-18.
//  Copyright (c) 2012年 张玺. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize lable;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.view.backgroundColor = RGB(25,255, 255);
    
    

    
    NSString *aim = @"hello world";
    NSString *key = @"zhangxi";
    NSString *encopty = [aim base64EncodedString];
    
    NSLog(@"%@",encopty);
    NSLog(@"%@",[encopty base64DecodedString]);
    NSLog(@"%@ md5:%@",aim,[aim stringMD5]);
    
    
    NSLog(@"%@",[[aim DESEncryptByKey:key] DESDecryptByKey:key]);
    
    
    NSLog(@">>>>>>>>>>>>>>>>>");
    NSLog(@"%@",[aim AES256EncryptWithKey:key]);
    NSLog(@"%@",[[aim AES256EncryptWithKey:key] AES256DecryptWithKey:key]);
    
    NSLog(@"aa:%@",[[NSString alloc] initWithData:[[aim dataUsingEncoding:NSUTF8StringEncoding] AES256EncryptWithKey:key] encoding:NSUTF8StringEncoding]);
    
    
    NSLog(@"%@",[[NSString alloc] initWithData:[[[aim dataUsingEncoding:NSUTF8StringEncoding] AES256EncryptWithKey:key] AES256DecryptWithKey:key] encoding:NSUTF8StringEncoding]);
    
    
    
    
    ZXSegmentController *controller = [[ZXSegmentController alloc] initWithBgName:@"b"
                                                                        andTitles:@[@"first",@"2",@"3"]
                                                                        withFrame:CGRectMake(50, 50, 210, 44)];
    
    controller.titleColorNormal = [UIColor orangeColor];
    controller.delegate = self;
    [self.view addSubview:controller];
    


    //UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    //[self.view addSubview:bar];
    
	// Do any additional setup after loading the view, typically from a nib.
    

    
    
    UIView *view1  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    view1.backgroundColor = kColor_Red;
    [self.view addSubview:view1];
    view1.center = kP1;
    
    UIView *view2  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    view2.backgroundColor = kColor_Red;
    [self.view addSubview:view2];
    view2.center = kP2;
    
    UIView *view3  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    view3.backgroundColor = kColor_Red;
    [self.view addSubview:view3];
    view3.center = kP3;
    
    UIView *view4  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    view4.backgroundColor = kColor_Red;
    [self.view addSubview:view4];
    view4.center = kP4;
    
    UIView *view5  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    view5.backgroundColor = kColor_Red;
    [self.view addSubview:view5];
    view5.center = kP5;
    
    UIView *view6  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    view6.backgroundColor = kColor_Red;
    [self.view addSubview:view6];
    view6.center = kP6;
    
    UIView *view7  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    view7.backgroundColor = kColor_Red;
    [self.view addSubview:view7];
    view7.center = kP7;
    
    UIView *view8  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    view8.backgroundColor = kColor_Red;
    [self.view addSubview:view8];
    view8.center = kP8;
    
    UIView *view9  = [[UIView alloc] initWithFrame:CGRectMake(0,0, 10, 10)];
    view9.backgroundColor = kColor_Red;
    [self.view addSubview:view9];
    view9.center = kP9;
    
    NSLog(@"%@",self.view);
    NSLog(@"%@",view9);
    
}
-(void)segment:(ZXSegmentController *)segment didSelected:(int)index
{
    NSLog(@"%d",index);
}
- (void)viewDidUnload
{
    [self setLable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)push:(id)sender {
    ViewController *view = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    [self.navigationController pushViewController:view animated:YES];
}
@end
