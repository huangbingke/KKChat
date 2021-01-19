//
//  KKSocketManager.h
//  KKChat
//
//  Created by KK on 2021/1/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, KKSocketStatus) {
    KKSocketStatusConnecting,
    KKSocketStatusConnected,
    KKSocketStatusFailed,
    KKSocketStatusSystemClose,
    KKSocketStatusUserClose,
    KKSocketStatusReceived,
};

@interface KKSocketManager : NSObject

+ (instancetype)shareManager;

- (void)connect;

- (void)close;



@end

NS_ASSUME_NONNULL_END
