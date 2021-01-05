//
//  KKHomeListCellModel.m
//  KKChat
//
//  Created by KK on 2020/12/24.
//

#import "KKHomeListCellModel.h"

@implementation KKHomeListCellModel

@end

@implementation KKHomeSearchCellModel 

@end

@implementation KKHomeThridDeviceCellModel

- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                    cellIdentifier:(NSString *)cellIdentifier
                   deviceImageName:(NSString *)deviceImageName
                               tip:(NSString *)tip {
    if (self = [super initWithCellHeight:cellHeight cellIdentifier:cellIdentifier]) {
        self.deviceImageName = deviceImageName;
        self.tip = tip;
    }
    return self;
}

@end


@implementation KKHomeNoNetworkCellModel


@end

@implementation KKHomeChatCellModel

- (CGFloat)cellHeight {
    return 70;
}
- (NSString *)cellIdentifier {
    return KKHomeChatCellID;
}

@end
