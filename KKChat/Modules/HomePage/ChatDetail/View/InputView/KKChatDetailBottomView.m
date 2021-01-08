//
//  KKChatDetailBottomView.m
//  KKChat
//
//  Created by q.zhang on 2021/1/7.
//

#import "KKChatDetailBottomView.h"
#import "NSString+Category.h"
#import "KKChatMoreView.h"
#import "KKChatExpressionView.h"
@interface KKChatDetailBottomView ()<UITextViewDelegate>

@property (nonatomic, strong) UIButton *switchBtn;//语音文字切换
@property (nonatomic, strong) UIButton *expressionBtn; //表情包
@property (nonatomic, strong) UIButton *voiceBtn;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, strong) UITextView *inputTextView;
@property (nonatomic, assign) KKInputType inputType;

@property (nonatomic, strong) KKChatMoreView *moreView;
@property (nonatomic, strong) KKChatExpressionView *expressionView;

@property (nonatomic, assign) CGFloat textHeight;

@end
@implementation KKChatDetailBottomView

- (instancetype)initWithInputType:(KKInputType)type {
    if (self = [super init]) {
        self.inputType = type;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHidden:) name:UIKeyboardDidHideNotification object:nil];
        self.textHeight = 60;
    }
    return self;
}
#pragma mark - UI -
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

- (void)updateUIForExpressionView:(BOOL)selected {
    MASViewAttribute *masAtt;
    if (selected) {
        [self addSubview:self.expressionView];
        [self.expressionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(self);
            make.height.mas_equalTo(300);
        }];
        masAtt = self.expressionView.mas_top;
    } else {
        masAtt = self.mas_bottom;
        [self.expressionView removeFromSuperview];
    }
    [self.switchBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10);
        make.bottom.mas_equalTo(masAtt).offset(-10);
        make.width.height.mas_equalTo(35);
    }];
    [self.moreBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-10);
        make.bottom.mas_equalTo(masAtt).offset(-10);
        make.width.height.mas_equalTo(35);
    }];
    
    [self.expressionBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.moreBtn.mas_left).offset(-15);
        make.bottom.mas_equalTo(masAtt).offset(-10);
        make.width.height.mas_equalTo(35);
    }];
    [self.inputTextView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.switchBtn.mas_right).offset(10);
        make.right.mas_equalTo(self.expressionBtn.mas_left).offset(-10);
        make.top.mas_equalTo(self).offset(10);
        make.bottom.mas_equalTo(masAtt).offset(-10);
    }];
    if ([self.delegate respondsToSelector:@selector(bottomViewTextViewDidChangeForHeight:)]) {
        [self.delegate bottomViewTextViewDidChangeForHeight:self.textHeight+300];
    }
}

- (void)updateUIForMoreView:(BOOL)selected {
    MASViewAttribute *masAtt;
    if (selected) {
        [self addSubview:self.moreView];
        [self.moreView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.mas_equalTo(self);
            make.height.mas_equalTo(200);
        }];
        masAtt = self.moreView.mas_top;
    } else {
        masAtt = self.mas_bottom;
        [self.moreView removeFromSuperview];
    }
    [self.switchBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10);
        make.bottom.mas_equalTo(masAtt).offset(-10);
        make.width.height.mas_equalTo(35);
    }];
    [self.moreBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-10);
        make.bottom.mas_equalTo(masAtt).offset(-10);
        make.width.height.mas_equalTo(35);
    }];
    
    [self.expressionBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.moreBtn.mas_left).offset(-15);
        make.bottom.mas_equalTo(masAtt).offset(-10);
        make.width.height.mas_equalTo(35);
    }];
    [self.inputTextView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.switchBtn.mas_right).offset(10);
        make.right.mas_equalTo(self.expressionBtn.mas_left).offset(-10);
        make.top.mas_equalTo(self).offset(10);
        make.bottom.mas_equalTo(masAtt).offset(-10);
    }];
    if ([self.delegate respondsToSelector:@selector(bottomViewTextViewDidChangeForHeight:)]) {
        [self.delegate bottomViewTextViewDidChangeForHeight:self.textHeight+200];
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
        NSLog(@"弹出表情框");
    } else {
        NSLog(@"收起表情框");
        [self.inputTextView becomeFirstResponder];
        [sender setImage:[UIImage svgImageName:@"expression.svg" targetSize:CGSizeMake(32, 32) tintColor:UIColor.blackColor] forState:(UIControlStateNormal)];
    }
    [self updateUIForExpressionView:sender.selected];
}
- (void)moreBtnAction:(UIButton *)sender {
    [self.inputTextView resignFirstResponder];
    sender.selected = !sender.selected;
    if (sender.selected) {
        NSLog(@"弹出 更多");
        self.inputType = KKInputTypeText;
        [self.inputTextView resignFirstResponder];
        [self.switchBtn setImage:[UIImage svgImageName:@"icons_outlined_voice.svg" targetSize:CGSizeMake(35, 35)] forState:(UIControlStateNormal)];
        [self.voiceBtn removeFromSuperview];
    } else {
        NSLog(@"收起更多,  弹出键盘");
        [self.inputTextView becomeFirstResponder];
    }
    [self updateUIForMoreView:sender.selected];
}
- (void)voiceBtnTouchDownAction:(UIButton *)sender {
    [sender setTitle:@"松开 结束" forState:(UIControlStateNormal)];
    NSLog(@"此处处理录音逻辑");
}

- (void)voiceBtnTouchUpInsideAction:(UIButton *)sender {
    [sender setTitle:@"按住 说话" forState:(UIControlStateNormal)];
    NSLog(@"录音结束");
}
#pragma mark - Keyboard Notificition -
- (void)keyboardDidShow:(NSNotification *)sender {
    [self.expressionView removeFromSuperview];
    [self.moreView removeFromSuperview];
    NSValue *value = [[sender userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGFloat height = [value CGRectValue].size.height;
    NSLog(@"弹起键盘高度: %f", height);
    if ([self.delegate respondsToSelector:@selector(bottomViewTextViewDidChangeForHeight:)]) {
        [self.delegate bottomViewTextViewDidChangeForHeight:self.textHeight+height];
    }
}
- (void)keyboardDidHidden:(NSNotification *)sender {
    if ([self.delegate respondsToSelector:@selector(bottomViewTextViewDidChangeForHeight:)]) {
        [self.delegate bottomViewTextViewDidChangeForHeight:self.textHeight];
    }
}
#pragma mark - UITextViewDelegate -
- (void)textViewDidChange:(UITextView *)textView {
//    NSLog(@"计算文字高度: %@", textView.text);
    CGFloat height = 40;
    CGSize size = [textView.text boundingALLRectWithText:textView.text Font:[UIFont systemFontOfSize:18] Size:CGSizeMake(kScreenWidth-(10*4+15+35*3), CGFLOAT_MAX)];
    if (size.height > 40) {
        height = size.height;
    }
    self.textHeight = height + 20;
    if ([self.delegate respondsToSelector:@selector(bottomViewTextViewDidChangeForHeight:)]) {
        [self.delegate bottomViewTextViewDidChangeForHeight:height+20];
    }
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([@"\n" isEqualToString:text]) {
        if ([self.delegate respondsToSelector:@selector(bottomViewSendMsgBtnAction:)]) {
            [self.delegate bottomViewSendMsgBtnAction:textView.text];
        }
        textView.text = @"";
        [self textViewDidChange:textView];
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
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
        _inputTextView.delegate = self;
        _inputTextView.returnKeyType = UIReturnKeySend;
        _inputTextView.showsHorizontalScrollIndicator = NO;
    }
    return _inputTextView;
}

- (KKChatMoreView *)moreView {
    if (!_moreView) {
        _moreView = [[KKChatMoreView alloc] init];
        _moreView.backgroundColor = [UIColor redColor];
    }
    return _moreView;
}
- (KKChatExpressionView *)expressionView {
    if (!_expressionView) {
        _expressionView = [[KKChatExpressionView alloc] init];
        _expressionView.backgroundColor = [UIColor greenColor];
    }
    return _expressionView;
}

#pragma mark - dealloc -
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
