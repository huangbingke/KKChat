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
@property (nonatomic, assign) KKInputType inputType;
@end
@implementation KKChatDetailBottomView

- (instancetype)initWithInputType:(KKInputType)type {
    if (self = [super init]) {
        self.inputType = type;
    }
    return self;
}

- (void)layoutSubviews {
    [self setupUI];
}

- (void)setupUI {
    self.backgroundColor = kColor(0xf5f5f5);
    [self addSubview:self.switchBtn];
    [self addSubview:self.expressionBtn];
    [self addSubview:self.moreBtn];
    
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
    
    [self inputTextOrVoice];
}

- (void)inputTextOrVoice {
    if (self.inputType == KKInputTypeText) {
        [self.switchBtn setImage:[UIImage svgImageName:@"icons_outlined_voice.svg" targetSize:CGSizeMake(35, 35)] forState:(UIControlStateNormal)];
        [self.voiceBtn removeFromSuperview];
        [self addSubview:self.inputTextView];
        [self.inputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.switchBtn.mas_right).offset(10);
            make.right.mas_equalTo(self.expressionBtn.mas_left).offset(-10);
            make.top.mas_equalTo(self).offset(10);
            make.bottom.mas_equalTo(self).offset(-10);
        }];
    } else {
        [self.expressionBtn setImage:[UIImage svgImageName:@"expression.svg" targetSize:CGSizeMake(32, 32) tintColor:UIColor.blackColor] forState:(UIControlStateNormal)];
        [self.switchBtn setImage:[UIImage svgImageName:@"icons_outlined_keyboard.svg" targetSize:CGSizeMake(35, 35)] forState:(UIControlStateNormal)];
        [self.inputTextView removeFromSuperview];
        [self addSubview:self.voiceBtn];
        [self.voiceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.switchBtn.mas_right).offset(10);
            make.right.mas_equalTo(self.expressionBtn.mas_left).offset(-10);
            make.top.mas_equalTo(self).offset(10);
            make.bottom.mas_equalTo(self).offset(-10);
        }];
    }
}


#pragma mark - Action -
- (void)switchBtnAction:(UIButton *)sender {
    if (self.inputType == KKInputTypeText) {
        [sender setImage:[UIImage svgImageName:@"icons_outlined_keyboard.svg" targetSize:CGSizeMake(35, 35)] forState:(UIControlStateNormal)];
        self.inputType = KKInputTypeVoice;
    } else {
        [self.inputTextView becomeFirstResponder];
        [sender setImage:[UIImage svgImageName:@"icons_outlined_voice.svg" targetSize:CGSizeMake(35, 35)] forState:(UIControlStateNormal)];
        self.inputType = KKInputTypeText;
    }
    [self inputTextOrVoice];
}
- (void)expressionBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.inputType = KKInputTypeText;
        [self.inputTextView resignFirstResponder];
        [self.expressionBtn setImage:[UIImage svgImageName:@"icons_outlined_keyboard.svg" targetSize:CGSizeMake(35, 35) tintColor:UIColor.blackColor] forState:(UIControlStateNormal)];
        
        [self.switchBtn setImage:[UIImage svgImageName:@"icons_outlined_voice.svg" targetSize:CGSizeMake(35, 35)] forState:(UIControlStateNormal)];
        [self.voiceBtn removeFromSuperview];
    } else {
        [self.inputTextView becomeFirstResponder];
        [sender setImage:[UIImage svgImageName:@"expression.svg" targetSize:CGSizeMake(32, 32) tintColor:UIColor.blackColor] forState:(UIControlStateNormal)];
    }

}
- (void)moreBtnAction:(UIButton *)sender {
    [self.inputTextView resignFirstResponder];
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.inputType = KKInputTypeText;
        [self.inputTextView resignFirstResponder];
        [self.switchBtn setImage:[UIImage svgImageName:@"icons_outlined_voice.svg" targetSize:CGSizeMake(35, 35)] forState:(UIControlStateNormal)];
        [self.voiceBtn removeFromSuperview];
    } else {
        [self.inputTextView becomeFirstResponder];
    }
}
- (void)voiceBtnTouchDownAction:(UIButton *)sender {
    [sender setTitle:@"松开 结束" forState:(UIControlStateNormal)];
    NSLog(@"此处处理录音逻辑");
}

- (void)voiceBtnTouchUpInsideAction:(UIButton *)sender {
    [sender setTitle:@"按住 说话" forState:(UIControlStateNormal)];
    NSLog(@"录音结束");
}
#pragma mark - Getter -
- (UIButton *)switchBtn {
    if (!_switchBtn) {
        _switchBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_switchBtn addTarget:self action:@selector(switchBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
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
        [_voiceBtn addTarget:self action:@selector(voiceBtnTouchDownAction:) forControlEvents:(UIControlEventTouchDown)];
        [_voiceBtn addTarget:self action:@selector(voiceBtnTouchUpInsideAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_voiceBtn setTitle:@"按住 说话" forState:(UIControlStateNormal)];
        _voiceBtn.titleLabel.font = [UIFont boldSystemFontOfSize:15];
        [_voiceBtn setTitleColor:UIColor.blackColor forState:(UIControlStateNormal)];
        _voiceBtn.backgroundColor = [UIColor whiteColor];
        _voiceBtn.layer.cornerRadius = 5;
        _voiceBtn.layer.masksToBounds = YES;
    }
    return _voiceBtn;
}
- (UITextView *)inputTextView {
    if (!_inputTextView) {
        _inputTextView = [[UITextView alloc] init];
        _inputTextView.backgroundColor = [UIColor whiteColor];
        _inputTextView.font = [UIFont systemFontOfSize:18];
        _inputTextView.layer.cornerRadius = 5;
        _inputTextView.layer.masksToBounds = YES;
        _inputTextView.tintColor = kThemeColor;
    }
    return _inputTextView;
}

@end
