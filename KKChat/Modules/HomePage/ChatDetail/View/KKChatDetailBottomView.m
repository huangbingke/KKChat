//
//  KKChatDetailBottomView.m
//  KKChat
//
//  Created by q.zhang on 2021/1/7.
//

#import "KKChatDetailBottomView.h"
@interface KKChatDetailBottomView ()

@property (nonatomic, strong) UIButton *switchBtn;//语音文字切换
@property (nonatomic, strong) UIButton *expressionBtn; //表情包
@property (nonatomic, strong) UIButton *voiceBtn;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, strong) UITextView *inputTextView;

@end
@implementation KKChatDetailBottomView


- (void)layoutSubviews {
    [self setupUI];
    [self layoutUI];
}

- (void)setupUI {
    self.backgroundColor = kColor(0xf5f5f5);
    [self addSubview:self.switchBtn];
    [self addSubview:self.expressionBtn];
    [self addSubview:self.moreBtn];
    [self addSubview:self.inputTextView];
//    [self addSubview:self.voiceBtn];
}

- (void)layoutUI {
    [self.switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10);
        make.bottom.mas_equalTo(self).offset(-10);
        make.width.height.mas_equalTo(35);
    }];
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-10);
        make.bottom.mas_equalTo(self).offset(-10);
        make.width.height.mas_equalTo(35);
    }];
    
    [self.expressionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.moreBtn.mas_left).offset(-15);
        make.bottom.mas_equalTo(self).offset(-10);
        make.width.height.mas_equalTo(35);
    }];
    
    [self.inputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.switchBtn.mas_right).offset(10);
        make.right.mas_equalTo(self.expressionBtn.mas_left).offset(-10);
        make.top.mas_equalTo(self).offset(10);
        make.bottom.mas_equalTo(self).offset(-10);
    }];
    
    
}

#pragma mark - Action -
- (void)switchBtnAction:(UIButton *)sender {
    
}
- (void)expressionBtnAction:(UIButton *)sender {
    
}
- (void)moreBtnAction:(UIButton *)sender {
    
}
- (void)voiceBtnAction:(UIButton *)sender {

}
#pragma mark - Getter -
- (UIButton *)switchBtn {
    if (!_switchBtn) {
        _switchBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_switchBtn addTarget:self action:@selector(switchBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_switchBtn setImage:[UIImage svgImageName:@"icons_outlined_keyboard.svg" targetSize:CGSizeMake(35, 35)] forState:(UIControlStateNormal)];
    }
    return _switchBtn;
}
- (UIButton *)expressionBtn {
    if (!_expressionBtn) {
        _expressionBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_expressionBtn addTarget:self action:@selector(expressionBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_expressionBtn setImage:[UIImage svgImageName:@"expression.svg" targetSize:CGSizeMake(32, 32) tintColor:UIColor.blackColor] forState:(UIControlStateNormal)];
    }
    return _expressionBtn;
}
- (UIButton *)moreBtn {
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_moreBtn addTarget:self action:@selector(moreBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_moreBtn setImage:[UIImage svgImageName:@"icons_outlined_add2.svg" targetSize:CGSizeMake(35, 35) tintColor:UIColor.blackColor] forState:(UIControlStateNormal)];
    }
    return _moreBtn;
}
- (UIButton *)voiceBtn {
    if (!_voiceBtn) {
        _voiceBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_voiceBtn addTarget:self action:@selector(voiceBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_voiceBtn setTitle:@"按住说话" forState:(UIControlStateNormal)];
        _voiceBtn.backgroundColor = [UIColor whiteColor];
    }
    return _voiceBtn;
}
- (UITextView *)inputTextView {
    if (!_inputTextView) {
        _inputTextView = [[UITextView alloc] init];
        _inputTextView.backgroundColor = [UIColor whiteColor];
        _inputTextView.font = [UIFont systemFontOfSize:18];
        _inputTextView.layer.cornerRadius = 3;
        _inputTextView.layer.masksToBounds = YES;
    }
    return _inputTextView;
}

@end
