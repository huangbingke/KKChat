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

/**
 重连时间间隔，默认3秒钟
 */
@property(nonatomic, assign) NSTimeInterval overtime;
 
/**
 重连次数，默认无限次 -- NSUIntegerMax
 */
@property(nonatomic, assign) NSUInteger reconnectCount;
+ (instancetype)shareManager;

- (void)connect;

- (void)close;



@end

NS_ASSUME_NONNULL_END
