//
//  KKIMTextMsgCellModel.h
//  KKChat
//
//  Created by q.zhang on 2021/1/15.
//

#import "KKIMBaseModel.h"

NS_ASSUME_NONNULL_BEGIN
extern NSInteger const KKIMTextMsgFont;

@interface KKIMTextMsgCellModel : KKIMBaseModel

@property (nonatomic, copy) NSAttributedString *contentAttributedText;

@property (nonatomic, assign) CGFloat oneLineWidth;

- (instancetype)initWithIsMe:(BOOL)isMe
       contentAttributedText:(NSAttributedString *)contentAttributedText;

@end

NS_ASSUME_NONNULL_END
