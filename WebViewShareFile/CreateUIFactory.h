//
//  CreateUIFactory.h
//  WebViewShareFile
//
//  Created by reason on 2018/10/18.
//  Copyright © 2018年 reason. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kcscaleWidth [[UIScreen mainScreen] bounds].size.width/320
NS_ASSUME_NONNULL_BEGIN

@interface CreateUIFactory : UIView
-(UIView*)CreateView:(CGRect)frame BKColor:(UIColor*)bkColor  MainView:(UIView*)mainView;
-(UIButton*)createBtn:(CGRect)frame  TitleStr:(NSString*)titleStr MainView:(UIView*)mainView;
@end

NS_ASSUME_NONNULL_END
