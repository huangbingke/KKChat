//
//  KKIMTextMsgCellModel.m
//  KKChat
//
//  Created by q.zhang on 2021/1/15.
//

#import "KKIMTextMsgCellModel.h"
#import "NSString+Category.h"
#import <YYText/YYTextLayout.h>
NSInteger const KKIMTextMsgFont = 18;
@implementation KKIMTextMsgCellModel
- (CGFloat)oneLineHeight {
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:CGSizeMake(kScreenWidth - 134-13, CGFLOAT_MAX) text:[[NSAttributedString alloc] initWithString:@"哈😄"]];
    return ceil(layout.textBoundingSize.height);
}

- (CGFloat)oneLineWidthWithText:(NSAttributedString *)text {
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:CGSizeMake(CGFLOAT_MAX, 20) text:text];
    return ceil(layout.textBoundingSize.width);
}
- (CGFloat)heightForText:(NSAttributedString *)text {
    YYTextLayout *layout = [YYTextLayout layoutWithContainerSize:CGSizeMake(kScreenWidth - 134-13, CGFLOAT_MAX) text:text];
    return ceil(layout.textBoundingSize.height);
}

- (CGFloat)cellHeight {
    if (self.contentAttributedText) {
        CGFloat textHeight = [self heightForText:self.contentAttributedText];
        CGFloat oneLineHeight = [self oneLineHeight];
        if (textHeight <= oneLineHeight) {
            return 36+kTopBottomMargin*2;
        } else {
            return ceil(textHeight) + 10 + kTopBottomMargin*2;
        }
        return 0;
    }
    return 0;
}


- (instancetype)initWithIsMe:(BOOL)isMe
       contentAttributedText:(NSAttributedString *)contentAttributedText{
    if (self = [super initWithIsMe:isMe]) {
        self.contentAttributedText = contentAttributedText;
    }
    return self;
}



@end
