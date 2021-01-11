//
//  KKNormalCellModel.h
//  KKChat
//
//  Created by q.zhang on 2021/1/11.
//

#import "KKBaseCellModel.h"

typedef NS_ENUM(NSUInteger, KKNormalCellTargetType) {
    KKNormalCellTargetTypePyq,//朋友圈
    KKNormalCellTargetTypeVodie,//视频号
    KKNormalCellTargetTypeScan, //扫一扫
    KKNormalCellTargetTypeShake,//摇一摇
    KKNormalCellTargetTypeWatch,//看一看
    KKNormalCellTargetTypeSearch,//搜一搜
    KKNormalCellTargetTypeNear,//附近的直播和人
    KKNormalCellTargetTypeShop,//购物
    KKNormalCellTargetTypeGame,//游戏
    KKNormalCellTargetTypeApp,//小程序
    KKNormalCellTargetTypePay, //支付
    KKNormalCellTargetTypeCollection, //收藏
    KKNormalCellTargetTypePyqMe, //我的朋友圈
    KKNormalCellTargetTypeCardBag, //卡包
    KKNormalCellTargetTypeExpression, // 表情
    KKNormalCellTargetTypeSetting,//设置
};
NS_ASSUME_NONNULL_BEGIN

@interface KKNormalCellModel : KKBaseCellModel

@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) KKNormalCellTargetType targetType;
- (instancetype)initWithName:(NSString *)name
                         pic:(NSString *)pic
                  targetType:(KKNormalCellTargetType)targetType;




@end

NS_ASSUME_NONNULL_END
