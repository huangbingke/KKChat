//
//  KKIMRedBagMsgCellModel.m
//  KKChat
//
//  Created by q.zhang on 2021/1/15.
//

#import "KKIMRedBagMsgCellModel.h"

@implementation KKIMRedBagMsgCellModel

- (instancetype)initWithIsMe:(BOOL)isMe
                transferType:(KKIMMsgTransferType)transferType
                      reamrk:(NSString *)remark
                      amount:(CGFloat)amount {
    if (self = [super initWithIsMe:isMe]) {
        self.transferType = transferType;
        self.remark = remark;
        self.amount = amount;
    }
    return self;
}

- (CGFloat)cellHeight {
    return 80;
}


@end
