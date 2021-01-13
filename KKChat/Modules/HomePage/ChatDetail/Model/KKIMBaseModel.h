//
//  KKIMBaseModel.h
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

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

@property (nonatomic, copy) NSString *sendDate;//发送的时间
@property (nonatomic, assign) BOOL sendSuccess;//是否发送成功
//@property (nonatomic, assign)

@end

@interface KKIMTextMsgCellModel : KKIMBaseModel

@property (nonatomic, copy) NSAttributedString *contentAttributedText;

@end

@interface KKIMVoiceMsgCellModel : KKIMBaseModel



@end

@interface KKIMImageMsgCellModel : KKIMBaseModel



@end

@interface KKIMRedBagMsgCellModel : KKIMBaseModel



@end

@interface KKIMTimeMsgCellModel : KKIMBaseModel

@property (nonatomic, copy) NSString *showDate;//展示的时间

@end

@interface KKIMSmallAppMsgCellModel : KKIMBaseModel

@property (nonatomic, copy) NSString *previewPicUrl;


@end

@interface KKIMCallMsgCellModel : KKIMBaseModel



@end

@interface KKIMInvitationMsgCellModel : KKIMBaseModel

@end

NS_ASSUME_NONNULL_END
