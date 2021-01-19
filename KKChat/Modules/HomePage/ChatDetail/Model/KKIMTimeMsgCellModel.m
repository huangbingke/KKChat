//
//  KKIMTimeMsgCellModel.m
//  KKChat
//
//  Created by q.zhang on 2021/1/15.
//

#import "KKIMTimeMsgCellModel.h"

@implementation KKIMTimeMsgCellModel


- (instancetype)initWithShowDate:(NSString *)showDate {
    if (self = [super init]) {
        self.showDate = showDate;
    }
    return self;
}


- (CGFloat)cellHeight {
    return 40;
}





@end
