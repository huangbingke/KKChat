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
@property (nonatomic, assign) BOOL openSelectStatus; //是否开启多选

@end
#pragma mark  ========================我是分割线=========================
@interface KKIMTextMsgCellModel : KKIMBaseModel

@property (nonatomic, copy) NSAttributedString *contentAttributedText;

@end
#pragma mark  ========================我是分割线=========================
@interface KKIMVoiceMsgCellModel : KKIMBaseModel



@end
#pragma mark  ========================我是分割线=========================
@interface KKIMImageMsgCellModel : KKIMBaseModel



@end
#pragma mark  ========================我是分割线=========================
@interface KKIMRedBagMsgCellModel : KKIMBaseModel



@end
#pragma mark  ========================我是分割线=========================
@interface KKIMTimeMsgCellModel : KKIMBaseModel

@property (nonatomic, copy) NSString *showDate;//展示的时间

@end
#pragma mark  ========================我是分割线=========================
@interface KKIMSmallAppMsgCellModel : KKIMBaseModel

@property (nonatomic, copy) NSString *previewPicUrl;


@end
#pragma mark  ========================我是分割线=========================
@interface KKIMCallMsgCellModel : KKIMBaseModel



@end
#pragma mark  ========================我是分割线=========================
@interface KKIMInvitationMsgCellModel : KKIMBaseModel

@end
#pragma mark  ========================我是分割线=========================
@interface KKIMChatRecordMsgCellModel : KKIMBaseModel

@end
#pragma mark  ========================我是分割线=========================
@interface KKIMReEditMsgCellModel : KKIMBaseModel

@end


NS_ASSUME_NONNULL_END
