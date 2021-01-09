//
//  KKHomeListCellModel.h
//  KKChat
//
//  Created by KK on 2020/12/24.
//

#import "KKBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, KKMessageType) {
    KKMessageTypeNone,
    KKMessageTypeFileHelper,   //文件传输助手
    KKMessageTypePersonalChat,   //聊天
    KKMessageTypeRoomChat,   //群聊
    KKMessageTypeSubscription, //订阅号
    KKMessageTypePublic, //订阅号
};
extern NSString * const KKHomeChatCellID;
extern NSString * const KKHomeNoNetworkCellID;
extern NSString * const KKHomeThridDeviceCellID;
extern NSString * const KKHomeSearchCellID;

@interface KKHomeListCellModel : KKBaseCellModel



@end

@interface KKHomeSearchCellModel : KKHomeListCellModel




@end

@interface KKHomeThridDeviceCellModel : KKHomeListCellModel

@property (nonatomic, copy) NSString *deviceImageName;
@property (nonatomic, copy) NSString *tip;

- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                    cellIdentifier:(NSString *)cellIdentifier
                   deviceImageName:(NSString *)deviceImageName
                               tip:(NSString *)tip;

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
@property (nonatomic, assign) KKMessageType messageType;//单聊, 群聊, 公众号, 订阅号...



@end


NS_ASSUME_NONNULL_END
