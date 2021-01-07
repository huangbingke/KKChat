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

@interface KKChatDetailBottomView : UIView


- (instancetype)initWithInputType:(KKInputType)type;





@end

NS_ASSUME_NONNULL_END
