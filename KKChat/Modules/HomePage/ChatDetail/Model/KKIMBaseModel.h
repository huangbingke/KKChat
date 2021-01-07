//
//  KKIMBaseModel.h
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, KKIMCellTargetType) {
    KKIMCellTargetTypeNone,
    KKIMCellTargetTypeCallVoice,
    KKIMCellTargetTypeCallVideo,
    KKIMCellTargetTypeSmallApp,
    KKIMCellTargetTypeImage,
    KKIMCellTargetTypeRedBag,
    
};


@interface KKIMBaseModel : KKBaseCellModel




@end

@interface KKIMTextMsgCellModel : KKIMBaseModel



@end

@interface KKIMVoiceMsgCellModel : KKIMBaseModel



@end

@interface KKIMImageMsgCellModel : KKIMBaseModel



@end

@interface KKIMRedBagMsgCellModel : KKIMBaseModel



@end

@interface KKIMTimeMsgCellModel : KKIMBaseModel



@end

@interface KKIMSmallAppCellModel : KKIMBaseModel



@end

@interface KKIMCallMsgCellModel : KKIMBaseModel



@end



NS_ASSUME_NONNULL_END
