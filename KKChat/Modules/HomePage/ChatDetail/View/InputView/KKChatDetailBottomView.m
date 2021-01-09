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
@property (nonatomic, strong) UIButton *expressionBtn; //表情
@property (nonatomic, strong) UIButton *voiceBtn;//按住说话
@property (nonatomic, strong) UIButton *moreBtn; //加号
@property (nonatomic, strong) UITextView *inputTextView; //输入框

@property (nonatomic, strong) KKChatMoreView *moreView; //
@property (nonatomic, strong) KKChatExpressionView *expressionView; //表情输入

@property (nonatomic, strong) UIButton *coverBtn;//覆盖在textView上的button

@property (nonatomic, assign) KKInputType inputType;

@property (nonatomic, assign) CGFloat textHeight;
@property (nonatomic, assign) CGFloat keyboardHeight;
@property (nonatomic, copy) NSString *inputContent;
@end
@implementation KKChatDetailBottomView

- (instancetype)initWithInputType:(KKInputType)type {
    if (self = [super init]) {
        self.inputType = type;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHidden:) name:UIKeyboardDidHideNotification object:nil];
        self.textHeight = 60;
        self.keyboardHeight = kIPhoneXBottomHeight;
    }
    return self;
}
#pragma mark - UI -
- (void)setupBottomViewUI {
    self.backgroundColor = kColor(0xf5f5f5);
    [self switchBtn];
    [self moreBtn];
    [self expressionBtn];

    if (self.inputType == KKInputTypeText) {
        self.switchBtn.selected = NO;
        [self inputTextView];

    } else {
        self.switchBtn.selected = YES;
        [self voiceBtn];
    }
}

#pragma mark - Action -
//语音文字切换
- (void)switchBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.moreBtn.selected = NO;
        self.expressionBtn.selected = NO;
        self.inputType = KKInputTypeVoice;
        [self.inputTextView removeFromSuperview];
        self.inputTextView = nil;
        [self voiceBtn];
    } else {
        self.inputType = KKInputTypeText;
        [self.voiceBtn removeFromSuperview];
        self.voiceBtn = nil;
        [self inputTextView];
        self.inputTextView.text = self.inputContent;
        [self.inputTextView becomeFirstResponder];
    }
    if ([self.delegate respondsToSelector:@selector(bottomViewTextViewDidChangeHeight:bottomMargin:)]) {
        [self.delegate bottomViewTextViewDidChangeHeight:sender.selected ? 60 : self.textHeight bottomMargin:self.keyboardHeight];
    }
}
//表情点击
- (void)expressionBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    dispatch_async(dispatch_get_main_queue(), ^{
        self.inputTextView.text = self.inputContent;
        self.switchBtn.selected = NO;
        self.moreBtn.selected = NO;
        if (sender.selected) {
            [self.inputTextView resignFirstResponder];
            self.inputTextView.inputView = self.expressionView;
            [self.inputTextView becomeFirstResponder];
            self.inputTextView.tintColor = UIColor.clearColor;
            [self coverBtn];
        } else {
            [self.inputTextView resignFirstResponder];
            self.inputTextView.inputView = nil;
            [self.inputTextView becomeFirstResponder];
            self.inputTextView.tintColor = kThemeColor;
            [self.coverBtn removeFromSuperview];
            self.coverBtn = nil;
        }
    });
}
//加号点击
- (void)moreBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    self.inputTextView.text = self.inputContent;
    self.switchBtn.selected = NO;
    self.expressionBtn.selected = NO;
    if (sender.selected) {
        [self.inputTextView resignFirstResponder];
        self.inputTextView.inputView = self.moreView;
        [self.inputTextView becomeFirstResponder];
        self.inputTextView.tintColor = UIColor.clearColor;
        [self coverBtn];
    } else {
        [self.inputTextView resignFirstResponder];
        self.inputTextView.inputView = nil;
        [self.inputTextView becomeFirstResponder];
        self.inputTextView.tintColor = kThemeColor;
        [self.coverBtn removeFromSuperview];
        self.coverBtn = nil;
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
- (void)inputViewIsEditing:(UIButton *)sender {
    NSLog(@"点击了键盘");
    if (self.expressionBtn.selected || self.moreBtn.selected) {
        self.expressionBtn.selected = NO;
        self.moreBtn.selected = NO;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.inputTextView resignFirstResponder];
            self.inputTextView.inputView = nil;
                [self.inputTextView becomeFirstResponder];
                self.inputTextView.tintColor = kThemeColor;
        });
        [self.coverBtn removeFromSuperview];
        self.coverBtn = nil;
    }
}
#pragma mark - Keyboard Notificition -
- (void)keyboardDidShow:(NSNotification *)sender {
//    NSValue *value = [[sender userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey];
//    CGFloat height = [value CGRectValue].size.height;
    //键盘高度 第二次弹起获取不准确, 这里先写死
    self.keyboardHeight = 336;
//    NSLog(@"弹起键盘高度: %f", height);
    
    if ([self.delegate respondsToSelector:@selector(bottomViewTextViewDidChangeHeight:bottomMargin:)]) {
        if (self.moreBtn.selected) {
            self.keyboardHeight = 200;
        }
        if (self.expressionBtn.selected) {
            self.keyboardHeight = 300;
        }
        [self.delegate bottomViewTextViewDidChangeHeight:self.textHeight bottomMargin:self.keyboardHeight];
    }
}
- (void)keyboardDidHidden:(NSNotification *)sender {
    self.keyboardHeight = kIPhoneXBottomHeight;
    if ([self.delegate respondsToSelector:@selector(bottomViewTextViewDidChangeHeight:bottomMargin:)]) {
        NSLog(@"333");
        CGFloat height = self.textHeight;
        if (self.switchBtn.selected) {
            height = 60;
        }
        [self.delegate bottomViewTextViewDidChangeHeight:height bottomMargin:kIPhoneXBottomHeight];
    }
}
#pragma mark - UITextViewDelegate -
- (void)textViewDidChange:(UITextView *)textView {
//    NSLog(@"计算文字高度: %@", textView.text);
    self.inputContent = textView.text;
    CGFloat height = 40;
    CGSize size = [textView.text boundingALLRectWithText:textView.text Font:[UIFont systemFontOfSize:18] Size:CGSizeMake(kScreenWidth-(10*4+15+35*3), CGFLOAT_MAX)];
    if (size.height > 40) {
        height = size.height;
        if (size.height >= 150) {
            height = 150;
        }
    }
    self.textHeight = height + 20;
    if ([self.delegate respondsToSelector:@selector(bottomViewTextViewDidChangeHeight:bottomMargin:)]) {
        [self.delegate bottomViewTextViewDidChangeHeight:self.textHeight bottomMargin:self.keyboardHeight];
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
        [_switchBtn setImage:[UIImage svgImageName:@"icons_outlined_keyboard.svg" targetSize:CGSizeMake(35, 35)] forState:(UIControlStateSelected)];
        [_switchBtn setImage:[UIImage svgImageName:@"icons_outlined_voice.svg" targetSize:CGSizeMake(35, 35)] forState:(UIControlStateNormal)];
        [self addSubview:_switchBtn];
        [_switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self).offset(10);
            make.bottom.mas_equalTo(self).offset(-10);
            make.width.height.mas_equalTo(35);
        }];
    }
    return _switchBtn;
}
- (UIButton *)expressionBtn {
    if (!_expressionBtn) {
        _expressionBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_expressionBtn addTarget:self action:@selector(expressionBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_expressionBtn setImage:[UIImage svgImageName:@"expression.svg" targetSize:CGSizeMake(32, 32) tintColor:UIColor.blackColor] forState:(UIControlStateNormal)];
        [_expressionBtn setImage:[UIImage svgImageName:@"icons_outlined_keyboard.svg" targetSize:CGSizeMake(35, 35) tintColor:UIColor.blackColor] forState:(UIControlStateSelected)];
        [self addSubview:_expressionBtn];
        [_expressionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.moreBtn.mas_left).offset(-15);
            make.bottom.mas_equalTo(self).offset(-10);
            make.width.height.mas_equalTo(35);
        }];
        
    }
    return _expressionBtn;
}
- (UIButton *)moreBtn {
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_moreBtn addTarget:self action:@selector(moreBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [_moreBtn setImage:[UIImage svgImageName:@"icons_outlined_add2.svg" targetSize:CGSizeMake(35, 35) tintColor:UIColor.blackColor] forState:(UIControlStateNormal)];
        [self addSubview:_moreBtn];
        [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self).offset(-10);
            make.bottom.mas_equalTo(self).offset(-10);
            make.width.height.mas_equalTo(35);
        }];
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
        [self addSubview:_voiceBtn];
        [_voiceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.switchBtn.mas_right).offset(10);
            make.right.mas_equalTo(self.expressionBtn.mas_left).offset(-10);
            make.top.mas_equalTo(self).offset(10);
            make.bottom.mas_equalTo(self).offset(-10);
        }];
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
        [self addSubview:_inputTextView];
        [_inputTextView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.switchBtn.mas_right).offset(10);
            make.right.mas_equalTo(self.expressionBtn.mas_left).offset(-10);
            make.top.mas_equalTo(self).offset(10);
            make.bottom.mas_equalTo(self).offset(-10);
        }];
    }
    return _inputTextView;
}
- (KKChatMoreView *)moreView {
    if (!_moreView) {
        _moreView = [[KKChatMoreView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200)];
        _moreView.backgroundColor = [UIColor yellowColor];
    }
    return _moreView;
}
- (KKChatExpressionView *)expressionView {
    if (!_expressionView) {
        _expressionView = [[KKChatExpressionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 300)];
        _expressionView.backgroundColor = [UIColor greenColor];
    }
    return _expressionView;
}

- (UIButton *)coverBtn {
    if (!_coverBtn) {
        _coverBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
//        _coverBtn.backgroundColor = [UIColor purpleColor];
        [_coverBtn addTarget:self action:@selector(inputViewIsEditing:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:_coverBtn];
        [_coverBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.switchBtn.mas_right).offset(10);
            make.right.mas_equalTo(self.expressionBtn.mas_left).offset(-10);
            make.top.mas_equalTo(self).offset(10);
            make.bottom.mas_equalTo(self).offset(-10);
        }];
    }
    return _coverBtn;
}


#pragma mark - dealloc -
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
