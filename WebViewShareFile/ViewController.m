//
//  ViewController.m
//  WebViewShareFile
//
//  Created by reason on 2018/10/18.
//  Copyright © 2018年 reason. All rights reserved.
//

#import "ViewController.h"
#import "WebViewVC.h"
#import "CreateUIFactory.h"
@interface ViewController (){
    CreateUIFactory *UIFactory;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (!UIFactory) {
        UIFactory=[[CreateUIFactory alloc]init];
        [self createUI];
        
    }
}
-(void)createUI{
    UIButton*btn=[UIFactory createBtn:CGRectMake(100, 100, 100, 50) TitleStr:@"WebShareFile" MainView:self.view];
    [btn addTarget:self action:@selector(openWebShareVC) forControlEvents:UIControlEventTouchUpInside];
}
-(void)openWebShareVC{
    WebViewVC *theView=[[WebViewVC alloc]init];
    [theView setTitle:@"WebShareFile"];
    [self.navigationController pushViewController:theView animated:YES];
   }
@end
