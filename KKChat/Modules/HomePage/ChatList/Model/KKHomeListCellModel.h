//
//  KKHomeListCellModel.h
//  KKChat
//
//  Created by KK on 2020/12/24.
//

#import "KKBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, KKHomeListCellTargetType) {
    KKHomeListCellTargetTypeNone,
    KKHomeListCellTargetTypePersonalChat,   //聊天
    KKHomeListCellTargetTypeNoNet,         //没有网
    KKHomeListCellTargetTypeSearch,        // 搜索
    KKHomeListCellTargetTypeThridDevice,   //第三方设备登录
    KKHomeListCellTargetTypeSubscription, //订阅号
    KKHomeListCellTargetTypePublic, //订阅号
};

@interface KKHomeListCellModel : KKBaseCellModel

@property (nonatomic, assign) KKHomeListCellTargetType targetType;




@end

@interface KKHomeSearchCellModel : KKHomeListCellModel




@end

@interface KKHomeThridDeviceCellModel : KKHomeListCellModel



@end


@interface KKHomeNoNetworkCellModel : KKHomeListCellModel



@end


@interface KKHomeChatCellModel : KKHomeListCellModel

@property (nonatomic, copy) NSString *headUrl; //头像
@property (nonatomic, copy) NSString *nickName; //昵称
@property (nonatomic, copy) NSString *message; //消息
@property (nonatomic, copy) NSString *messageConunt; //消息数量
@property (nonatomic, copy) NSString *isDisturb; //免打扰
@property (nonatomic, copy) NSString *date; //时间
@property (nonatomic, copy) NSString *userId;
@property (nonatomic, assign) NSString *chatType;//单聊, 群聊, 公众号, 订阅号...



@end


NS_ASSUME_NONNULL_END
