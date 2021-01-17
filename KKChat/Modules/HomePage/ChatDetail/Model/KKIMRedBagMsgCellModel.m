//
//  KKIMRedBagMsgCellModel.m
//  KKChat
//
//  Created by q.zhang on 2021/1/15.
//

#import "KKIMRedBagMsgCellModel.h"

@implementation KKIMRedBagMsgCellModel
- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                      transferType:(KKIMMsgTransferType)transferType
                            reamrk:(NSString *)remark
                            amount:(CGFloat)amount
                              isMe:(BOOL)isMe {
    if (self = [super initWithCellHeight:cellHeight]) {
        self.transferType = transferType;
        self.remark = remark;
        self.amount = amount;
        self.cellHeight = cellHeight;
        self.isMe = isMe;
    }
    return self;
}
@end
