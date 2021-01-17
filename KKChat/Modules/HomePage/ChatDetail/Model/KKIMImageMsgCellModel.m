//
//  KKIMImageMsgCellModel.m
//  KKChat
//
//  Created by q.zhang on 2021/1/15.
//

#import "KKIMImageMsgCellModel.h"

@interface KKIMImageMsgCellModel ()


@end
@implementation KKIMImageMsgCellModel

- (instancetype)initWithImage:(id)image isMe:(BOOL)isMe {
    if (self = [super init]) {
        if ([image isKindOfClass:UIImage.class]) {
            self.locationImage = image;
        } else {
            self.imageUrl = image;
        }
        self.isMe = isMe;
    }
    return self;
}

- (CGFloat)cellHeight {
    if (self.locationImage) {
        CGFloat height = self.imageSize.height;
        CGFloat width = self.imageSize.width;
        if (height >= width) {
            return 150;
        } else {
            return (kScreenWidth-60)/2 * (height/width) + kTopBottomMargin*2;
        }
    }
    return 0;
}

- (CGSize)imageSize {
    if (self.locationImage) {
        return self.locationImage.size;
    }
    return CGSizeZero;
}


@end
