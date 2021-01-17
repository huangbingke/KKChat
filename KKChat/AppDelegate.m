//
//  AppDelegate.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "AppDelegate.h"
#import "KKSocketManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [NSClassFromString(@"KKTabBarViewController") new];
    
//    [[KKSocketManager shareManager] connect];
    if (@available(iOS 13.0, *)) {
        self.window.rootViewController.overrideUserInterfaceStyle = UIUserInterfaceStyleUnspecified;
    }
    if (self.window.rootViewController.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
        NSLog(@"暗黑模式");
    } else {
        NSLog(@"非暗黑模式");
    }
    
    return YES;
}




@end
