//
//  KKDarkModeManager.m
//  KKChat
//
//  Created by KK on 2021/1/16.
//

#import "KKDarkModeManager.h"

@implementation KKDarkModeManager


+ (instancetype)shareManager {
    static dispatch_once_t onceToken;
    static KKDarkModeManager *manager = nil;
    dispatch_once(&onceToken, ^{
        manager = [KKDarkModeManager new];
    });
    return manager;
}


- (UIUserInterfaceStyle)currentInterfaceStyle {
    if ([UIApplication sharedApplication].delegate.window.rootViewController.traitCollection.userInterfaceStyle == UIUserInterfaceStyleDark) {
        NSLog(@"暗黑模式");
        return UIUserInterfaceStyleDark;
    } else {
        NSLog(@"非暗黑模式");
        return UIUserInterfaceStyleLight;
    }
}



- (BOOL)isDark {
    if ([self currentInterfaceStyle] == UIUserInterfaceStyleDark) {
        return YES;
    }
    return NO;
}








@end
