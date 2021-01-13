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
@property (nonatomic, strong) NSMutableArray<KKIMBaseModel *> *dataArray;
@end

@implementation KKChatDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = kColor(0xf7f7f7);

    
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
    [self.bottomView setupBottomViewUI];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KKIMBaseModel *baseModel = self.dataArray[indexPath.row];
    if ([baseModel isKindOfClass:KKIMTextMsgCellModel.class]) {
        KKIMTextMsgCell *cell = [tableView dequeueReusableCellWithIdentifier:KKIMTextMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    } else if ([baseModel isKindOfClass:KKIMVoiceMsgCellModel.class]) {
        KKIMVoiceMsgCell *cell = [tableView dequeueReusableCellWithIdentifier:KKIMVoiceMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    } else if ([baseModel isKindOfClass:KKIMImageMsgCellModel.class]) {
        KKIMImageMsgCell *cell = [tableView dequeueReusableCellWithIdentifier:KKIMImageMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    } else if ([baseModel isKindOfClass:KKIMRedBagMsgCellModel.class]) {
        KKIMRedBagMsgCell *cell = [tableView dequeueReusableCellWithIdentifier:KKIMRedBagMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    } else if ([baseModel isKindOfClass:KKIMTimeMsgCellModel.class]) {
        KKIMTimeMsgCell *cell = [tableView dequeueReusableCellWithIdentifier:KKIMTimeMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    } else if ([baseModel isKindOfClass:KKIMSmallAppMsgCellModel.class]) {
        KKIMSmallAppMsgCell *cell = [tableView dequeueReusableCellWithIdentifier:KKIMSmallAppMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    } else if ([baseModel isKindOfClass:KKIMCallMsgCellModel.class]) {
        KKIMCallMsgCell *cell = [tableView dequeueReusableCellWithIdentifier:KKIMCallMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    } else if ([baseModel isKindOfClass:KKIMInvitationMsgCellModel.class]) {
        KKIMInvitationMsgCell *cell = [tableView dequeueReusableCellWithIdentifier:KKIMInvitationMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    }
    return UITableViewCell.new;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    KKIMBaseModel *baseModel = self.dataArray[indexPath.row];
    return baseModel.cellHeight;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    KKIMBaseModel *baseModel = self.dataArray[indexPath.row];
    return baseModel.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.view endEditing:YES];
    KKIMBaseModel *baseModel = self.dataArray[indexPath.row];
    if ([baseModel isKindOfClass:KKIMTimeMsgCellModel.class]) {
        return;
    } else {
        
    }
}

#pragma mark - KKChatDetailBottomViewDelegate -
- (void)bottomViewSendMsgBtnAction:(NSString *)msg {
    NSLog(@"发送消息: %@", msg);
}
- (void)bottomViewTextViewDidChangeHeight:(CGFloat)height bottomMargin:(CGFloat)bottomMargin {
    NSLog(@"======> %f == %f", height, bottomMargin);
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
- (NSMutableArray<KKIMBaseModel *> *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

@end
