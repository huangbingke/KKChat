//
//  KKNavigationController.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKNavigationController.h"

@interface KKNavigationController ()

@end

@implementation KKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationBar.hidden = YES;
    
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end
