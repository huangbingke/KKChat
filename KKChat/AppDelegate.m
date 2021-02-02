//
//  AppDelegate.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "AppDelegate.h"
#import "KKSocketManager.h"
#import "KKDarkModeManager.h"
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
    
    [[KKDarkModeManager shareManager] currentInterfaceStyle];
    
    return YES;
}




@end
