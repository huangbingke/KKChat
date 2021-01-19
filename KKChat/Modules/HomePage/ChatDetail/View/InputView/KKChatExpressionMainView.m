//
//  KKExpressionView.m
//  KKChat
//
//  Created by q.zhang on 2021/1/8.
//

#import "KKChatExpressionMainView.h"
#import "KKChatExpressionView.h"

@interface KKChatExpressionMainView ()

@property (nonatomic, strong) KKChatExpressionView *expressionView;

@end
@implementation KKChatExpressionMainView



- (void)layoutIfNeeded {
    [self expressionView];
}

#pragma mark - Getter -
- (KKChatExpressionView *)expressionView {
    if (!_expressionView) {
        _expressionView = [[KKChatExpressionView alloc] init];
        [self addSubview:_expressionView];
        [_expressionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(self);
            make.top.mas_equalTo(self).offset(45);
        }];
        [_expressionView layoutIfNeeded];
    }
    return _expressionView;
}

@end
