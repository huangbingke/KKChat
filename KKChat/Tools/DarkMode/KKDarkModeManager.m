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
    
    return UIUserInterfaceStyleLight;
}












@end
