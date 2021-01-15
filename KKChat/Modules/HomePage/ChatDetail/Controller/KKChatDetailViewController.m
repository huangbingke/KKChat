//
//  KKChatDetailViewController.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKChatDetailViewController.h"
#import "KKChatTableView.h"
#import "KKChatDetailBottomView.h"
#import "KKHomeListCellModel.h"
@interface KKChatDetailViewController ()<UITableViewDelegate, UITableViewDataSource, KKChatDetailBottomViewDelegate>

@property (nonatomic, strong) KKChatTableView *chatTableView;
@property (nonatomic, strong) KKChatDetailBottomView *bottomView;
@property (nonatomic, strong) NSMutableArray<KKIMBaseModel *> *dataArray;
@end

@implementation KKChatDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kColor(0xf7f7f7);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cellMsgLongGestureAction:) name:KKIMCellMsgLongPressGestureNotificationName object:nil];
    
}

- (void)setupUI {
    @weakify(self);
    self.kkNavigationBar = [KKNavigationBar setupNavigationBarWithTitle:@"聊天" leftName:@"icons_filled_back.svg" leftAction:^{
        @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
    } rightName:@"icons_filled_more.svg" rightAction:^{
        NSLog(@"========");
//        @strongify(self);

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
    [self.bottomView setupBottomViewUI];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(KKChatTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView cellForRowAtIndexPath:indexPath dataArray:self.dataArray];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    KKIMBaseModel *baseModel = self.dataArray[indexPath.row];
    NSLog(@"坐标: %ld====%f", indexPath.row, baseModel.cellHeight);
    return baseModel.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (!self.chatModel.openSelectStatus) {//没有开启多选, return
        [self.bottomView dismiss];
        return;
    }
    KKIMBaseModel *baseModel = self.dataArray[indexPath.row];
    if ([baseModel isKindOfClass:KKIMTimeMsgCellModel.class]
        || [baseModel isKindOfClass:KKIMReEditMsgCellModel.class]) {
        return;
    } else {
        baseModel.isSelect = !baseModel.isSelect;
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationNone)];
    }
}

#pragma mark - Action -
- (void)cellMsgLongGestureAction:(NSNotification *)notification {
    NSLog(@"长按啦");
    
}

#pragma mark - KKChatDetailBottomViewDelegate -
- (void)bottomViewSendMsgBtnAction:(NSString *)msg {
    NSLog(@"发送消息: %@", msg);
    NSAttributedString *att = [[NSAttributedString alloc] initWithString:msg];
    KKIMTextMsgCellModel *model = [[KKIMTextMsgCellModel alloc] initWithContentAttributedText:att isMe:YES];
    [self.dataArray addObject:model];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0];
    [self.chatTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationNone)];
    [self.chatTableView scrollToRowAtIndexPath:indexPath atScrollPosition:(UITableViewScrollPositionBottom) animated:NO];
}
- (void)bottomViewTextViewDidChangeHeight:(CGFloat)height bottomMargin:(CGFloat)bottomMargin {
    [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view).offset(-bottomMargin);
        make.height.mas_equalTo(height);
    }];
}


#pragma mark - Getter -
- (KKChatTableView *)chatTableView {
    if (!_chatTableView) {
        _chatTableView = [[KKChatTableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _chatTableView.dataSource = self;
        _chatTableView.delegate = self;
        _chatTableView.backgroundColor = kBgColor;
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
- (NSMutableArray<KKIMBaseModel *> *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
        
//        KKIMTextMsgCellModel *leftTextModel = [[KKIMTextMsgCellModel alloc] initWithContentAttributedText:[[NSAttributedString alloc] initWithString:@"哈哈哈😄😄😄😄😄😄😄😄😄"] isMe:NO];
        KKIMTextMsgCellModel *leftTextModel1 = [[KKIMTextMsgCellModel alloc] initWithContentAttributedText:[[NSAttributedString alloc] initWithString:@"哈哈哈😄😄😄😄😄😄😄😄😄"] isMe:NO];
        KKIMTextMsgCellModel *rightTextModel = [[KKIMTextMsgCellModel alloc] initWithContentAttributedText:[[NSAttributedString alloc] initWithString:@"哈哈哈😄😄😄😄😄😄😄😄😄"] isMe:YES];
        KKIMTextMsgCellModel *rightTextModel1 = [[KKIMTextMsgCellModel alloc] initWithContentAttributedText:[[NSAttributedString alloc] initWithString:@"哈哈哈😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄"] isMe:YES];
        KKIMTextMsgCellModel *rightTextMode2 = [[KKIMTextMsgCellModel alloc] initWithContentAttributedText:[[NSAttributedString alloc] initWithString:@"哈哈哈😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄"] isMe:YES];
        KKIMTextMsgCellModel *rightTextMode3 = [[KKIMTextMsgCellModel alloc] initWithContentAttributedText:[[NSAttributedString alloc] initWithString:@"哈哈哈😄😄😄😄😄😄😄😄😄"] isMe:YES];
        KKIMTextMsgCellModel *rightTextMode4 = [[KKIMTextMsgCellModel alloc] initWithContentAttributedText:[[NSAttributedString alloc] initWithString:@"哈哈哈😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄"] isMe:YES];
        KKIMTextMsgCellModel *rightTextMode5 = [[KKIMTextMsgCellModel alloc] initWithContentAttributedText:[[NSAttributedString alloc] initWithString:@"哈哈哈😄😄😄😄😄😄😄😄😄"] isMe:YES];
        KKIMTextMsgCellModel *rightTextMode6 = [[KKIMTextMsgCellModel alloc] initWithContentAttributedText:[[NSAttributedString alloc] initWithString:@"哈哈哈😄😄😄😄😄😄😄😄😄"] isMe:YES];
        KKIMTextMsgCellModel *rightTextMode7 = [[KKIMTextMsgCellModel alloc] initWithContentAttributedText:[[NSAttributedString alloc] initWithString:@"哈哈哈😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄"] isMe:YES];
        KKIMTextMsgCellModel *rightTextMode8 = [[KKIMTextMsgCellModel alloc] initWithContentAttributedText:[[NSAttributedString alloc] initWithString:@"哈哈哈😄😄😄😄😄😄😄😄😄"] isMe:YES];
        KKIMTextMsgCellModel *rightTextMode9 = [[KKIMTextMsgCellModel alloc] initWithContentAttributedText:[[NSAttributedString alloc] initWithString:@"哈哈哈😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄😄"] isMe:YES];

        [_dataArray addObjectsFromArray:@[rightTextModel, rightTextModel1, rightTextMode2, rightTextMode3, rightTextMode4, rightTextMode5, rightTextMode6, rightTextMode7, rightTextMode8, rightTextMode9]];
        
//        KKIMVoiceMsgCellModel *model1 = [[KKIMVoiceMsgCellModel alloc] initWithCellHeight:60 cellIdentifier:KKIMVoiceMsgCellID];
//        KKIMImageMsgCellModel *model2 = [[KKIMImageMsgCellModel alloc] initWithCellHeight:60 cellIdentifier:KKIMImageMsgCellID];
//        KKIMRedBagMsgCellModel *model3 = [[KKIMRedBagMsgCellModel alloc] initWithCellHeight:60 cellIdentifier:KKIMRedBagMsgCellID];
//        KKIMTimeMsgCellModel *model4 = [[KKIMTimeMsgCellModel alloc] initWithCellHeight:60 cellIdentifier:KKIMTimeMsgCellID];
//        KKIMSmallAppMsgCellModel *model5 = [[KKIMSmallAppMsgCellModel alloc] initWithCellHeight:60 cellIdentifier:KKIMSmallAppMsgCellID];
//        KKIMCallMsgCellModel *model6 = [[KKIMCallMsgCellModel alloc] initWithCellHeight:60 cellIdentifier:KKIMCallMsgCellID];
//        KKIMInvitationMsgCellModel *model7 = [[KKIMInvitationMsgCellModel alloc] initWithCellHeight:60 cellIdentifier:KKIMInvitationMsgCellID];
//        KKIMChatRecordMsgCellModel *model8 = [[KKIMChatRecordMsgCellModel alloc] initWithCellHeight:60 cellIdentifier:KKIMChatRecordMsgCellID];
//        KKIMReEditMsgCellModel *model9 = [[KKIMReEditMsgCellModel alloc] initWithCellHeight:60 cellIdentifier:KKIMReEditMsgCellID];
//        KKIMVideoMsgCellModel *model10 = [[KKIMVideoMsgCellModel alloc] initWithCellHeight:60 cellIdentifier:KKIMVideoMsgCellID];
//        [_dataArray addObjectsFromArray:@[model1, model2, model3, model4, model5, model6, model7, model8, model9, model10]];
        
    }
    return _dataArray;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
