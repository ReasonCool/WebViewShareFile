//
//  CreateUIFactory.m
//  WebViewShareFile
//
//  Created by reason on 2018/10/18.
//  Copyright © 2018年 reason. All rights reserved.
//

#import "CreateUIFactory.h"

@implementation CreateUIFactory
-(UIView*)CreateView:(CGRect)frame BKColor:(UIColor*)bkColor  MainView:(UIView*)mainView{
    UIView*lineView=[[UIView alloc]initWithFrame:frame];
    //CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, khLine)];
    [lineView setBackgroundColor:bkColor];
    [mainView addSubview:lineView];
    return lineView;
}
-(UIButton*)createBtn:(CGRect)frame  TitleStr:(NSString*)titleStr MainView:(UIView*)mainView{
    UIButton* btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
   if (titleStr && titleStr.length>0) {
        [btn setTitle:titleStr forState:UIControlStateNormal];
    }
    [btn setFrame:frame];
  
    [mainView addSubview:btn];
    return  btn;
}


@end
