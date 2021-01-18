//
//  KKIMBaseModel.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKIMBaseModel.h"
CGFloat const kTopBottomMargin = 6.f;
CGFloat const kCornerRadius = 3;
CGFloat const kMsgLeftRightMargin = 61;
@implementation KKIMBaseModel


- (instancetype)initWithIsMe:(BOOL)isMe {
    if (self = [super init]) {
        self.isMe = isMe;
    }
    return self;
}
- (instancetype)initWithIsMe:(BOOL)isMe cellHeight:(CGFloat)cellHeight {
    if (self = [super init]) {
        self.isMe = isMe;
        self.cellHeight = cellHeight;
    }
    return self;
}




@end
