//
//  WebShareView.h
//  WebViewShareFile
//
//  Created by reason on 2018/10/18.
//  Copyright © 2018年 reason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "CreateUIFactory.h"
NS_ASSUME_NONNULL_BEGIN
//@protocol DropOpenViewDelegate <NSObject>
//@optional-(void)MainAreaTouchUpInside:(BasicButtonDic*)theBtn;
//@end
@interface WebShareView : WKWebView<WKNavigationDelegate,WKUIDelegate>
-(id)initWebShareWithFrame:(CGRect)frame ViewController:(UIViewController*)viewControler;
@end

NS_ASSUME_NONNULL_END
