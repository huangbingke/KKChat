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
@property (nonatomic, assign) BOOL isScrollBottom;
@end

@implementation KKChatDetailViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.isScrollBottom = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kColor(0xf7f7f7);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cellMsgLongGestureAction:) name:KKIMCellMsgLongPressGestureNotificationName object:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0];
        [self.chatTableView scrollToRowAtIndexPath:indexPath atScrollPosition:(UITableViewScrollPositionBottom) animated:YES];
    });
    
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
    if (!self.isScrollBottom && self.dataArray.count > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0];
            [self.chatTableView scrollToRowAtIndexPath:indexPath atScrollPosition:(UITableViewScrollPositionMiddle) animated:NO];
        });
    }
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(KKChatTableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView cellForRowAtIndexPath:indexPath dataArray:self.dataArray];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    KKIMBaseModel *baseModel = self.dataArray[indexPath.row];
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
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    if (self.bottomView.isOpen) {
//        if (!self.chatModel.openSelectStatus) {//没有开启多选, return
//            [self.bottomView dismiss];
//            return;
//        }
//    }
//}
#pragma mark - Action -
- (void)cellMsgLongGestureAction:(NSNotification *)notification {
    NSLog(@"长按啦");
    
}

#pragma mark - KKChatDetailBottomViewDelegate -
- (void)bottomViewSendMsgBtnAction:(NSString *)msg {
    NSLog(@"发送消息: %@", msg);
    NSAttributedString *att = [[NSAttributedString alloc] initWithString:msg];
    KKIMTextMsgCellModel *model = [[KKIMTextMsgCellModel alloc] initWithIsMe:YES contentAttributedText:att];
    [self.dataArray addObject:model];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0];
    [self.chatTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationNone)];
    [self.chatTableView scrollToRowAtIndexPath:indexPath atScrollPosition:(UITableViewScrollPositionMiddle) animated:NO];
}
- (void)bottomViewTextViewDidChangeHeight:(CGFloat)height bottomMargin:(CGFloat)bottomMargin {
    [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.view).offset(-bottomMargin);
        make.height.mas_equalTo(height);
    }];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0];
        [self.chatTableView scrollToRowAtIndexPath:indexPath atScrollPosition:(UITableViewScrollPositionMiddle) animated:NO];
    });
}
- (void)bottomViewShouldBeginEditing:(UITextView *)textView {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0];
        [self.chatTableView scrollToRowAtIndexPath:indexPath atScrollPosition:(UITableViewScrollPositionMiddle) animated:NO];
    });
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
        
        KKIMCallMsgCellModel *leftVoiceCallmodel = [[KKIMCallMsgCellModel alloc] initWithIsMe:NO duration:100 callType:(KKIMCallTypeVoice) status:(KKIMCallStatusEnd)];
        KKIMCallMsgCellModel *rightVoiceCallmodel = [[KKIMCallMsgCellModel alloc] initWithIsMe:YES duration:100 callType:(KKIMCallTypeVoice) status:(KKIMCallStatusEnd)];
        [_dataArray addObjectsFromArray:@[leftVoiceCallmodel, rightVoiceCallmodel]];
        

        KKIMRedBagMsgCellModel *leftTranModel = [[KKIMRedBagMsgCellModel alloc] initWithIsMe:NO transferType:(KKIMMsgTransferTypeTransfer) reamrk:@"测试" amount:0.01];
        KKIMRedBagMsgCellModel *leftRedModel = [[KKIMRedBagMsgCellModel alloc] initWithIsMe:NO  transferType:(KKIMMsgTransferTypeRedBag) reamrk:@"恭喜发财, 大吉大利" amount:0.01];
        KKIMRedBagMsgCellModel *rightTranModel = [[KKIMRedBagMsgCellModel alloc] initWithIsMe:YES transferType:(KKIMMsgTransferTypeRedBag) reamrk:@"恭喜发财, 大吉大利" amount:0.01];
        KKIMRedBagMsgCellModel *rightRedModel = [[KKIMRedBagMsgCellModel alloc] initWithIsMe:YES transferType:(KKIMMsgTransferTypeTransfer) reamrk:@"拿去花" amount:0.01];
        [_dataArray addObjectsFromArray:@[leftTranModel, leftRedModel, rightTranModel, rightRedModel]];
        
        KKIMTextMsgCellModel *leftTextModel = [[KKIMTextMsgCellModel alloc] initWithIsMe: NO contentAttributedText:[[NSAttributedString alloc] initWithString:@"哈哈哈😄😄😄😄😄"]];
        KKIMTextMsgCellModel *rightTextModel = [[KKIMTextMsgCellModel alloc] initWithIsMe:YES contentAttributedText:[[NSAttributedString alloc] initWithString:@"哈哈哈😄😄😄😄😄😄😄😄😄"]];
        [_dataArray addObjectsFromArray:@[leftTextModel, rightTextModel]];
        
        KKIMImageMsgCellModel *leftImageModel = [[KKIMImageMsgCellModel alloc] initWithIsMe:NO image:[UIImage imageNamed:@"1-1.png"]];
        KKIMImageMsgCellModel *leftImageModel1 = [[KKIMImageMsgCellModel alloc] initWithIsMe:NO image:[UIImage imageNamed:@"2-3.png"]];
        KKIMImageMsgCellModel *leftImageModel2 = [[KKIMImageMsgCellModel alloc] initWithIsMe:NO image:[UIImage imageNamed:@"3-2.png"]];
        [_dataArray addObjectsFromArray:@[leftImageModel, leftImageModel1, leftImageModel2]];
        
        KKIMTimeMsgCellModel *timeModel = [[KKIMTimeMsgCellModel alloc] init];
        [_dataArray addObject:timeModel];
        KKIMImageMsgCellModel *rightImageModel = [[KKIMImageMsgCellModel alloc] initWithIsMe:YES image:[UIImage imageNamed:@"1-1.png"]];
        KKIMImageMsgCellModel *rightImageModel1 = [[KKIMImageMsgCellModel alloc] initWithIsMe:YES image:[UIImage imageNamed:@"2-3.png"]];
        KKIMImageMsgCellModel *rightImageModel2 = [[KKIMImageMsgCellModel alloc] initWithIsMe:YES image:[UIImage imageNamed:@"3-2.png"]];
        [_dataArray addObjectsFromArray:@[rightImageModel, rightImageModel1, rightImageModel2]];
        
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
