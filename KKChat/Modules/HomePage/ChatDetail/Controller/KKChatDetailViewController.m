//
//  KKChatDetailViewController.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKChatDetailViewController.h"
#import "KKChatTableView.h"
#import "KKChatDetailBottomView.h"
@interface KKChatDetailViewController ()<UITableViewDelegate, UITableViewDataSource, KKChatDetailBottomViewDelegate>

@property (nonatomic, strong) KKChatTableView *chatTableView;
@property (nonatomic, strong) KKChatDetailBottomView *bottomView;
@property (nonatomic, assign) CGFloat keyboardHeight;
@property (nonatomic, assign) CGFloat bottomViewHeight;

@end

@implementation KKChatDetailViewController
{
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kColor(0xf5f5f5);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHidden:) name:UIKeyboardDidHideNotification object:nil];

    
}

- (void)setupUI {
    @weakify(self);
    self.kkNavigationBar = [KKNavigationBar setupNavigationBarWithTitle:@"聊天" backAction:^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    [self.view addSubview:self.chatTableView];
    [self.view addSubview:self.bottomView];
}

- (void)layoutUI {
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.view).offset(-kIPhoneXBottomHeight);
        make.height.mas_equalTo(60);
    }];
    [self.chatTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view).offset(kNavHeight);
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(self.bottomView.mas_top).offset(0);
    }];
}
- (void)updateUIForBottomView {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(self.view);
            make.bottom.mas_equalTo(self.view).offset((self.keyboardHeight==0) ? -kIPhoneXBottomHeight : -self.keyboardHeight);
            make.height.mas_equalTo((self.bottomViewHeight == 0) ? 60 : self.bottomViewHeight);
        }];
    });
}
#pragma mark - UITableViewDelegate, UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    return UITableViewCell.new;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
}

#pragma mark - KKChatDetailBottomViewDelegate -
- (void)bottomViewExpressionBtnAction:(UIButton *)sender {
    if (sender.selected) {
        NSLog(@"弹出表情");
    } else {
        NSLog(@"收起表情");
    }
}
- (void)bottomViewMoreBtnAction:(UIButton *)sender {
    if (sender.selected) {
        NSLog(@"弹出更多菜单选项");
    } else {
        NSLog(@"关闭更多菜单选项");
    }
}
- (void)bottomViewSendMsgBtnAction:(NSString *)msg {
    NSLog(@"发送消息: %@", msg);
}
- (void)bottomViewTextViewDidChangeForHeight:(CGFloat)height {
    NSLog(@"======> %f", height);
    self.bottomViewHeight = height;
    //获取键盘高度, bottomView高度  更新frame
    [self updateUIForBottomView];
}

#pragma mark - Keyboard Notificition -
- (void)keyboardDidShow:(NSNotification *)sender {
    NSValue *value = [[sender userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGFloat height = [value CGRectValue].size.height;
    self.keyboardHeight = ceil(height);
    NSLog(@"弹起键盘高度: %f", height);
    [self updateUIForBottomView];
}
- (void)keyboardDidHidden:(NSNotification *)sender {
    self.keyboardHeight = 0;
    [self updateUIForBottomView];
}
#pragma mark - Getter -
- (KKChatTableView *)chatTableView {
    if (!_chatTableView) {
        _chatTableView = [[KKChatTableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _chatTableView.dataSource = self;
        _chatTableView.delegate = self;
        _chatTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _chatTableView;
}
- (KKChatDetailBottomView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[KKChatDetailBottomView alloc] initWithInputType:(KKInputTypeText)];
        _bottomView.delegate = self;
    }
    return _bottomView;
}

#pragma mark - dealloc -
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
