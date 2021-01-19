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
    return 100;
}

- (CGFloat)cellHeight {
    return 36+kTopBottomMargin*2;
}





@end
