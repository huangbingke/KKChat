//
//  KKIMCallMsgCellModel.m
//  KKChat
//
//  Created by q.zhang on 2021/1/15.
//

#import "KKIMCallMsgCellModel.h"

@implementation KKIMCallMsgCellModel


- (instancetype)initWithIsMe:(BOOL)isMe
                    duration:(NSTimeInterval)duration
                    callType:(KKIMCallType)callType
                      status:(KKIMCallStatus)status {
    if (self = [super initWithIsMe:isMe]) {
        self.duration = duration;
        self.callType = callType;
        self.status = status;
    }
    return self;
}


- (CGFloat)width {
    //这里需要根据不同状态, 展示不同宽度, 计算出响应的宽度, 这里先固定写死, 后期优化
    return 120;
}

- (CGFloat)cellHeight {
    return 36+kTopBottomMargin*2;
}





@end
