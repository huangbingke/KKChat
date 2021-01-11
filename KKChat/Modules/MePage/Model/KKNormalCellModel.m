//
//  KKNormalCellModel.m
//  KKChat
//
//  Created by q.zhang on 2021/1/11.
//

#import "KKNormalCellModel.h"

@implementation KKNormalCellModel


- (instancetype)initWithName:(NSString *)name
                         pic:(NSString *)pic
                  targetType:(KKNormalCellTargetType)targetType {
    if (self = [super init]) {
        self.name = name;
        self.pic = pic;
        self.targetType = targetType;
    }
    return self;
}








@end
