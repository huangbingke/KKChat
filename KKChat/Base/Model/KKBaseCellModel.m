//
//  KKBaseCellModel.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKBaseCellModel.h"

@implementation KKBaseCellModel



- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                    cellIdentifier:(NSString *)cellIdentifier {
    if (self = [super init]) {
        self.cellHeight = cellHeight;
        self.cellIdentifier = cellIdentifier;
    }
    return self;
}

- (instancetype)initWithCellHeight:(CGFloat)cellHeight {
    if (self = [super init]) {
        self.cellHeight = cellHeight;
    }
    return self;
}




@end
