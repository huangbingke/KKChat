//
//  KKIMCallMsgCellModel.h
//  KKChat
//
//  Created by q.zhang on 2021/1/15.
//

#import "KKIMBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, KKIMCallStatus) {
    KKIMCallStatusCancel, //取消
    KKIMCallStatusCalling,//成功
    KKIMCallStatusReject, //拒绝
    KKIMCallStatusFailed, //呼叫失败
    KKIMCallStatusEnd,
};

typedef NS_ENUM(NSUInteger, KKIMCallType) {
    KKIMCallTypeVoice,//语音通话
    KKIMCallTypeVoide,//视频通话
};

@interface KKIMCallMsgCellModel : KKIMBaseModel

@property (nonatomic, assign) NSTimeInterval duration;
@property (nonatomic, assign) KKIMCallStatus status;
@property (nonatomic, assign) KKIMCallType callType;
@property (nonatomic, assign) CGFloat width;

- (instancetype)initWithIsMe:(BOOL)isMe
                    duration:(NSTimeInterval)duration
                    callType:(KKIMCallType)callType
                      status:(KKIMCallStatus)status;
@end

NS_ASSUME_NONNULL_END
