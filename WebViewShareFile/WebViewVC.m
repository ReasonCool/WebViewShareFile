//
//  WebViewVC.m
//  WebViewShareFile
//
//  Created by reason on 2018/10/18.
//  Copyright © 2018年 reason. All rights reserved.
//

#import "WebViewVC.h"
#import "WebShareView.h"
#import <WebKit/WebKit.h>
@interface WebViewVC (){
    WebShareView*shareView;
   WKWebView* testView;
}

@end

@implementation WebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (!shareView) {
        [self createUI];
    }
}
-(void)createUI{
     NSURL*url=  [NSURL URLWithString:[@"https://www.ncl.edu.tw/downloadfilelist_273_2.html" stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
       // [request setTimeoutInterval:20];
    
    shareView=[[WebShareView alloc]initWebShareWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) ViewController:self];
    [self.view addSubview:shareView];
    [shareView  loadRequest:request];
   
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
