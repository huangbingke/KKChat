//
//  KKIMTimeMsgCellModel.m
//  KKChat
//
//  Created by q.zhang on 2021/1/15.
//

#import "KKIMTimeMsgCellModel.h"

@implementation KKIMTimeMsgCellModel


- (CGFloat)cellHeight {
    return 40;
}

//此处需要处理一下 当前时间与消息发送时间的时间差, 这里先固定写死
- (NSString *)showDate {
    return @"18:30";
}


@end
