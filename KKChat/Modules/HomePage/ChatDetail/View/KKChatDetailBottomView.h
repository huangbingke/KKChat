//
//  KKChatDetailBottomView.h
//  KKChat
//
//  Created by q.zhang on 2021/1/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, KKInputType) {
    KKInputTypeNone,
    KKInputTypeText,
    KKInputTypeVoice,
};

@protocol KKChatDetailBottomViewDelegate <NSObject>

- (void)bottomViewExpressionBtnAction:(UIButton *)sender;
- (void)bottomViewMoreBtnAction:(UIButton *)sender;
- (void)bottomViewSendMsgBtnAction:(NSString *)msg;
- (void)bottomViewTextViewDidChangeForHeight:(CGFloat)height;

@end

@interface KKChatDetailBottomView : UIView

@property (nonatomic, weak) id<KKChatDetailBottomViewDelegate>delegate;

- (instancetype)initWithInputType:(KKInputType)type;





@end

NS_ASSUME_NONNULL_END
