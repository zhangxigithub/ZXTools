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
    
    NSString *aim = @"hello world";
    NSString *key = @"zhangxi";
    NSString *encopty = [aim base64EncodedString];
    
    NSLog(@"%@",encopty);
    NSLog(@"%@",[encopty base64DecodedString]);
    NSLog(@"%@ md5:%@",aim,[aim stringMD5]);
    
    
    NSLog(@"%@",[[aim DESEncryptByKey:key] DESDecryptByKey:key]);
    
    
    NSLog(@">>>>>>>>>>>>>>>>>");
    //NSLog(@"%@",[aim AES256EncryptWithKey:key]);
    //NSLog(@"%@",[[aim AES256EncryptWithKey:key] AES256DecryptWithKey:key]);
    
    NSLog(@"aa:%@",[[NSString alloc] initWithData:[[aim dataUsingEncoding:NSUTF8StringEncoding] AES256EncryptWithKey:key] encoding:NSUTF8StringEncoding]);
    
    
    NSLog(@"%@",[[NSString alloc] initWithData:[[[aim dataUsingEncoding:NSUTF8StringEncoding] AES256EncryptWithKey:key] AES256DecryptWithKey:key] encoding:NSUTF8StringEncoding]);
    
    
    
    
    ZXSegmentController *controller = [[ZXSegmentController alloc] initWithBgName:@"b"
                                                                        andTitles:@[@"1",@"2",@"3"]
                                                                        withFrame:CGRectMake(50, 50, 210, 44)];
    [self.view addSubview:controller];
    


    //UINavigationBar *bar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    //[self.view addSubview:bar];
    
	// Do any additional setup after loading the view, typically from a nib.
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
