//
//  WebShareView.m
//  WebViewShareFile
//
//  Created by reason on 2018/10/18.
//  Copyright © 2018年 reason. All rights reserved.
//

#import "WebShareView.h"
@interface WebShareView (){
    UIView *pdfView;
    CreateUIFactory*UIFactory;
    NSData*pdfData;
    NSString*pdfDataLink;
    UIViewController* theViewController;
    
}
@end
@implementation WebShareView
-(id)initWebShareWithFrame:(CGRect)frame ViewController:(UIViewController*)viewControler{
    self=[super initWithFrame:frame];
    if (self) {
        theViewController=viewControler;
        UIFactory=[[CreateUIFactory alloc]init];
        self.UIDelegate=self;
        self.navigationDelegate=self;
    }
    return self;
}



- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler{
    
    NSString *requestString = navigationAction.request.URL.absoluteString;
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [navigationAction.request URL];
    pdfDataLink=url;
    if (navigationAction.targetFrame == nil) {
        [webView loadRequest:navigationAction.request];
    }
     decisionHandler(WKNavigationActionPolicyAllow);
    
    
}
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}
- (void)webView:(WKWebView *)webView  decidePolicyForNavigationResponse:(nonnull WKNavigationResponse *)navigationResponse decisionHandler:(nonnull void (^)(WKNavigationResponsePolicy))decisionHandler{
    pdfData=nil;
    NSString*memeTypeStr=  navigationResponse.response.MIMEType;
    if ([memeTypeStr isEqualToString:@"application/pdf"]) {
        pdfData=[NSData dataWithContentsOfURL:pdfDataLink];
        if (pdfData) {
            [self addPDFView:pdfData URLValue:pdfDataLink];
        }
    }
     decisionHandler(WKNavigationResponsePolicyAllow);
}
-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{
    
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
}

-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    
}


-(void)webView:(WKWebView *)webView commitPreviewingViewController:(UIViewController *)previewingViewController{
    
    
}
-(void)webViewDidClose:(WKWebView *)webView{
    
}


-(void)addPDFView:(NSData*)data URLValue:(NSURL*)urlValue{
    
   
    //bottomView add self.vbview
    CGFloat bottomHeight=64*kcscaleWidth;
    CGFloat  maxWidth=self.frame.size.width, posY=self.frame.size.height-bottomHeight,posX=16*kcscaleWidth, btnGap=20*kcscaleWidth, btnWidth=(maxWidth-posX-posX-btnGap)/2, btnHeight=32*kcscaleWidth;
    
    posY=posY+16*kcscaleWidth;
    
    UIButton*btn=[UIFactory createBtn:CGRectMake((maxWidth-btnWidth), posY, btnWidth, btnHeight) TitleStr:@"分   享"  MainView:self ];
    [btn.layer setBorderColor:[UIColor redColor].CGColor];
    [btn.layer setBorderWidth:2];
    [btn addTarget:self action:@selector(SharePDF:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)SharePDF:(UIButton*)btn{

    // create url
    NSURL *url = [NSURL fileURLWithPath:[NSTemporaryDirectory() stringByAppendingString:@"WebShareFile.pdf"]];
   
    // write data
    
    [pdfData writeToURL:url atomically:NO];
    
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[pdfDataLink, url] applicationActivities:nil];
    [theViewController presentViewController:activityVC animated:YES completion:nil];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
