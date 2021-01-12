//
//  KKNormalCellModel.m
//  KKChat
//
//  Created by q.zhang on 2021/1/11.
//

#import "KKNormalCellModel.h"

@implementation KKNormalCellModel


- (instancetype)initWithName:(NSString *)name
                       image:(UIImage *)image
                  targetType:(KKNormalCellTargetType)targetType {
    if (self = [super init]) {
        self.name = name;
        self.image = image;
        self.targetType = targetType;
    }
    return self;
}








@end
