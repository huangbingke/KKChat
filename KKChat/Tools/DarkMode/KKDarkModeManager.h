//
//  KKDarkModeManager.h
//  KKChat
//
//  Created by KK on 2021/1/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KKDarkModeManager : NSObject


+ (instancetype)shareManager;


- (UIUserInterfaceStyle)currentInterfaceStyle;


@property (nonatomic, assign) BOOL isDark;


@end

NS_ASSUME_NONNULL_END
