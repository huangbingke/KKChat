//
//  KKIMTimeMsgCellModel.m
//  KKChat
//
//  Created by q.zhang on 2021/1/15.
//

#import "KKIMTimeMsgCellModel.h"

@implementation KKIMTimeMsgCellModel


- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                          showDate:(NSString *)showDate {
    if (self = [super initWithCellHeight:cellHeight]) {
        self.showDate = showDate;
        self.cellHeight = cellHeight;
    }
    return self;
}








@end
