//
//  KKTabBarViewController.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKTabBarViewController.h"
#import "KKNavigationController.h"
#import "KKHomeViewController.h"
#import "KKContactsViewController.h"
#import "KKFinderViewController.h"
#import "KKMeViewController.h"

@interface KKTabBarViewController ()

@end

@implementation KKTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addViewController];
    
    
    
}

- (void)addViewController {
    KKNavigationController *homeNav = [self setViewController:KKHomeViewController.new title:@"聊天" defaultImageName:@"" selectedImageName:@""];
    KKNavigationController *contactsNav = [self setViewController:KKContactsViewController.new title:@"联系人" defaultImageName:@"" selectedImageName:@""];
    KKNavigationController *finderNav = [self setViewController:KKFinderViewController.new title:@"发现" defaultImageName:@"" selectedImageName:@""];
    KKNavigationController *meNav = [self setViewController:KKMeViewController.new title:@"我的" defaultImageName:@"" selectedImageName:@""];
    self.viewControllers = @[homeNav, contactsNav, finderNav, meNav];
}


- (KKNavigationController *)setViewController:(UIViewController *)viewController
                                        title:(NSString *)title
                             defaultImageName:(NSString *)defauleImageName
                            selectedImageName:(NSString *)selectedImageName {
    KKNavigationController *nav = [[KKNavigationController alloc] initWithRootViewController:viewController];
    viewController.tabBarItem.image = [UIImage imageNamed:defauleImageName];
    viewController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    viewController.tabBarItem.title = title;
    return nav;
}




@end
