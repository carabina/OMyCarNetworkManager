//
//  ViewController.m
//  OMyCarNetworkManager
//
//  Created by OMyCar on 2017/8/29.
//  Copyright © 2017年 com.lxh. All rights reserved.
//

#import "ViewController.h"
#import "OMyCarNetworkManager.h"
@interface ViewController ()<UIWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
#pragma mark - ++++++++++++++++++++++++++ get ++++++++++++++++++++++++++
    
    NSString *token = @"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC93d3cub215Y2FyYXBwLmNvbSIsImF1ZCI6Imh0dHA6XC9cL3d3dy5vbXljYXJhcHAuY29tIiwic3ViIjoiMTIyNiIsImlhdCI6MTUwMzkxNTU2MCwibmJmIjoxNTAzOTE1NTYwfQ.qHdWL_JUQiRmb4d_OLrfuCs1aKsIXcRtFaFuSjxep8w";
    NSString *time = @"1503998003";
    NSString *uid = @"1226";
    
//    // Do any additional setup after loading the view, typically from a nib.
//    [OMyCarNetworkManager netWorkGetUrl:@"http://api.omycarapp.com/v3/traffic/index" parameters:nil success:^(id data) {
//        
//    } fail:^(NSString *errorMessage) {
//        
//    }];
    
//    [OMyCarNetworkManager netWorkGetUrl:@"http://api.omycarapp.com/v3/traffic/index" parameters:nil progress:^(double progress) {
//        
//    } success:^(id data) {
//        
//    } fail:^(NSString *errorMessage) {
//        
//    }];


//    NSString *domains = @"http://dev.omycarapp.com/";
//    [OMyCarNetworkManager netWorkGetUrl:@"http://dev.omycarapp.com/Portal/User/getUserInfo" parameters:@{@"token":token,@"uid":uid,@"time":time} progress:^(double progress) {
//        
//    } success:^(id data) {
//        
//    } fail:^(NSString *errorMessage) {
//        
//    } appendContentType:@[@"application/a"]];
//

    
//    [OMyCarNetworkManager netWorkPostUrl:@"http://dev.omycarapp.com/Portal/User/getUserInfo" parameters:@{@"token":token,@"uid":uid,@"time":time} success:^(id data) {
//        
//    } fail:^(NSString *errorMessage) {
//        
//    }];
    
//    NSString *file = [[NSBundle mainBundle] pathForResource:@"test.png" ofType:nil];
//    NSData *data = [NSData dataWithContentsOfFile:file];
//    [OMyCarNetworkManager netWorkPostUrl:@"http://dev.omycarapp.com/Portal/User/updateUserHeadphoto" parameters:@{@"token":token,@"uid":uid,@"time":time} data:data dataFieldName:@"headphoto" fileType:@"png" success:^(id data) {
//        
//    } fail:^(NSString *errorMessage) {
//        
//    }];
    
//    [OMyCarNetworkManager netWorkReachAbilitystatus:^(BOOL statusType) {
//        
//    } type:^(NSString *status) {
//        
//    }];
    
    
    
//    NSString *str = [OMyCarNetworkManager netWorkAppendHostUrl:@"ddd" domainName:@"http://dev.omycarapp.com/"];
    
    
    NSString *str2 = [OMyCarNetworkManager netWorkFormatParameterUrl:@"http://activity-dev.omycarapp.com/#/insurance?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC93d3cub215Y2FyYXBwLmNvbSIsImF1ZCI6Imh0dHA6XC9cL3d3dy5vbXljYXJhcHAuY29tIiwic3ViIjoiMTIyNiIsImlhdCI6MTUwMzkxNTU2MCwibmJmIjoxNTAzOTE1NTYwfQ.qHdWL_JUQiRmb4d_OLrfuCs1aKsIXcRtFaFuSjxep8w&t=1504002707" domainName:@"http://dev.omycarapp.com/"];


    UIWebView *webView =[[UIWebView alloc]initWithFrame:self.view.bounds];
    webView.delegate = self;
    [self.view addSubview:webView];
    
    if (str2) {
        
        NSURLRequest *request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:str2]];
        [webView loadRequest:request];

    }

    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
