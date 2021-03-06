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

@interface KKTabBarViewController ()<UITabBarControllerDelegate>

@end

@implementation KKTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    [self addViewController];
}

- (void)addViewController {
    KKNavigationController *homeNav = [self setViewController:KKHomeViewController.new
                                                        title:@"聊天"
                                             defaultImageName:@"icons_outlined_chats.svg"
                                            selectedImageName:@"icons_filled_chats.svg"];
    KKNavigationController *contactsNav = [self setViewController:KKContactsViewController.new
                                                            title:@"联系人"
                                                 defaultImageName:@"icons_outlined_contacts.svg"
                                                selectedImageName:@"icons_filled_contacts.svg"];
    KKNavigationController *finderNav = [self setViewController:KKFinderViewController.new
                                                          title:@"发现"
                                               defaultImageName:@"icons_outlined_discover.svg"
                                              selectedImageName:@"icons_filled_discover.svg"];
    KKNavigationController *meNav = [self setViewController:KKMeViewController.new title:@"我的"
                                           defaultImageName:@"icons_outlined_me.svg"
                                          selectedImageName:@"icons_filled_me.svg"];
    self.viewControllers = @[homeNav, contactsNav, finderNav, meNav];
}


- (KKNavigationController *)setViewController:(UIViewController *)viewController
                                        title:(NSString *)title
                             defaultImageName:(NSString *)defauleImageName
                            selectedImageName:(NSString *)selectedImageName {
    KKNavigationController *nav = [[KKNavigationController alloc] initWithRootViewController:viewController];
    viewController.tabBarItem.image = [UIImage svgImageName:defauleImageName];
    UIImage *selectedImage = [UIImage svgImageName:selectedImageName targetSize:CGSizeMake(25, 25) tintColor:kThemeColor];
    viewController.tabBarItem.selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.title = title;
    if (@available(iOS 13.0, *)) {
        self.tabBar.tintColor = kThemeColor;
        self.tabBar.unselectedItemTintColor = kColor(0x191919);
    } else {
        NSDictionary *defaultAttr = @{NSForegroundColorAttributeName: kColor(0x191919)};
        NSDictionary *selectAttr = @{NSForegroundColorAttributeName: kThemeColor};
        [viewController.tabBarItem setTitleTextAttributes:defaultAttr forState:(UIControlStateNormal)];
        [viewController.tabBarItem setTitleTextAttributes:selectAttr forState:(UIControlStateSelected)];       
    }
    return nav;
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if ([viewController.tabBarItem.title isEqualToString:@"我的"]) {
        return NO;
    } else {
        return YES;
    }
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    KKNavigationController *nav = (KKNavigationController *)viewController;
    UIViewController *vc = nav.topViewController;
    if ([vc isKindOfClass:KKMeViewController.class]) {
        //...
    } else {
        //...
    }
}


@end
