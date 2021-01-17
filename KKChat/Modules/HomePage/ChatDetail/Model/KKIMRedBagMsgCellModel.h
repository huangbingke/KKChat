//
//  KKIMRedBagMsgCellModel.h
//  KKChat
//
//  Created by q.zhang on 2021/1/15.
//

#import "KKIMBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, KKIMMsgTransferType) {
    KKIMMsgTransferTypeTransfer,
    KKIMMsgTransferTypeRedBag,
};


@interface KKIMRedBagMsgCellModel : KKIMBaseModel

@property (nonatomic, assign) KKIMMsgTransferType transferType;
@property (nonatomic, copy) NSString *remark; //备注
@property (nonatomic, assign) CGFloat amount; //金额
@property (nonatomic, assign) BOOL isReceive;//是否领取
- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                      transferType:(KKIMMsgTransferType)transferType
                            reamrk:(NSString *)remark
                            amount:(CGFloat)amount
                              isMe:(BOOL)isMe;

@end

NS_ASSUME_NONNULL_END
