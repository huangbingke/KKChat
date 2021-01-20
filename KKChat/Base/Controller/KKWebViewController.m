//
//  KKWebViewController.m
//  KKChat
//
//  Created by q.zhang on 2021/1/12.
//

#import "KKWebViewController.h"
#import <WebKit/WebKit.h>
@interface KKWebViewController ()

@property (nonatomic, strong) WKWebView *webView;

@end

@implementation KKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    @weakify(self);
    self.kkNavigationBar = [KKNavigationBar setupNavigationBarWithTitle:@"" backAction:^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    
    if (self.localUrl) {
        NSString *path = [NSString stringWithFormat:@"file://%@/Resource/",[[NSBundle mainBundle] pathForResource:@"network_setting" ofType:@"html"]];
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"network_setting.html" withExtension:nil];
        [self.webView loadHTMLString:path baseURL: url];
    }
    
    ///Users/q.zhang/Desktop/KKChat/KKChat/Resource/network_setting.html
}


#pragma mark - Getter -
- (WKWebView *)webView {
    if (!_webView) {
        _webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, kNavHeight, kScreenWidth, kScreenHeight-kNavHeight)];
        [self.view addSubview:_webView];
    }
    return _webView;
}


@end
