//
//  KKIMBaseModel.h
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

extern CGFloat const kTopBottomMargin;
extern CGFloat const kCornerRadius;
extern CGFloat const kMsgLeftRightMargin;
typedef NS_ENUM(NSUInteger, KKIMMsgType) {
    KKIMMsgTypeNone,
    KKIMMsgTypeCallVoice,//语音通话
    KKIMMsgTypeCallVideo,//视频通话
    KKIMMsgTypeSmallApp,//小程序
    KKIMMsgTypeImage,//图片
    KKIMMsgTypeRedBag,//红包
    KKIMMsgTypeText,//文本消息
    KKIMMsgTypeDate,//日期
    KKIMMsgTypeInvitation,//进群邀请
};


@interface KKIMBaseModel : KKBaseCellModel

@property (nonatomic, assign) BOOL isMe;//是自己发送的, 还是别人发来的
@property (nonatomic, copy) NSString *sendDate;//发送的时间
@property (nonatomic, assign) BOOL sendSuccess;//是否发送成功
@property (nonatomic, assign) BOOL isSelect;

@end

NS_ASSUME_NONNULL_END
