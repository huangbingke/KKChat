//
//  KKChatDetailBottomView.h
//  KKChat
//
//  Created by q.zhang on 2021/1/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

extern CGFloat const KKChatDetailBottomViewAnimationDuration;


typedef NS_ENUM(NSUInteger, KKInputType) {
    KKInputTypeText,
    KKInputTypeVoice,
};

@protocol KKChatDetailBottomViewDelegate <NSObject>

- (void)bottomViewSendMsgBtnAction:(NSString *)msg;
- (void)bottomViewTextViewDidChangeHeight:(CGFloat)height bottomMargin:(CGFloat)bottomMargin;
- (void)bottomViewShouldBeginEditing:(UITextView *)textView;
@end

@interface KKChatDetailBottomView : UIView

@property (nonatomic, weak) id<KKChatDetailBottomViewDelegate>delegate;
@property (nonatomic, assign) BOOL isOpen; //弹出状态

- (instancetype)initWithInputType:(KKInputType)type;

- (void)setupBottomViewUI;

- (void)dismiss;


@end

NS_ASSUME_NONNULL_END
