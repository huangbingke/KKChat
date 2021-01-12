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
//        NSURL* ul = [NSURL URLWithString:[NSString stringWithFormat:@"file://%@", url]];
//        [self.webView loadFileURL:ul allowingReadAccessToURL:[ul URLByDeletingLastPathComponent]];
//        [self.webView loadHTMLString:<#(nonnull NSString *)#> baseURL:<#(nullable NSURL *)#>]
    }
    
    
    
    
    
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
