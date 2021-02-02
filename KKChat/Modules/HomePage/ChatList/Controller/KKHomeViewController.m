//
//  KKHomeViewController.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKHomeViewController.h"
#import "KKHomeSearchCell.h"
#import "KKHomeThridDeviceCell.h"
#import "KKHomeNoNetworkCell.h"
#import "KKHomeChatCell.h"
#import "KKHomeNavBarView.h"
#import "KKChatDetailViewController.h"
#import "KKWebViewController.h"
@interface KKHomeViewController ()<UITableViewDelegate, UITableViewDataSource, KKHomeNavBarViewDelegate>
@property (nonatomic, strong) UITableView *listTableView;
@property (nonatomic, strong) KKHomeNavBarView *navBarView;
@property (nonatomic, strong) NSMutableArray<KKHomeListCellModel *> *dataArray;
@end

@implementation KKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    KKHomeNoNetworkCellModel *netModel = [[KKHomeNoNetworkCellModel alloc] initWithCellHeight:44 cellIdentifier:KKHomeNoNetworkCellID];
    KKHomeThridDeviceCellModel *deviceModel = [[KKHomeThridDeviceCellModel alloc] initWithCellHeight:44 cellIdentifier:KKHomeThridDeviceCellID deviceImageName:@"icons_filled_imac.svg" tip:@"Mac微信已登录"];
    [self.dataArray addObjectsFromArray:@[netModel, deviceModel]];
    
    KKHomeChatCellModel *chatModel = [[KKHomeChatCellModel alloc] initWithCellHeight:70 cellIdentifier:KKHomeChatCellID];
    [self.dataArray addObject:chatModel];
    
    [self.listTableView reloadData];
}
- (void)setupUI {
    self.view.backgroundColor = kBgColor;
    [self.view addSubview:self.listTableView];
    [self.listTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.view).offset(0);
    }];
}
#pragma mark - UITableViewDelegate, UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KKHomeListCellModel *model = self.dataArray[indexPath.row];
    if ([model isKindOfClass:KKHomeSearchCellModel.class]) {
        KKHomeSearchCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellIdentifier];
        [cell loadModel:model];
        return cell;
    } else if ([model isKindOfClass:KKHomeNoNetworkCellModel.class]) {
        KKHomeNoNetworkCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellIdentifier];
        [cell loadModel:model];
        return cell;
    } else if ([model isKindOfClass:KKHomeThridDeviceCellModel.class]) {
        KKHomeThridDeviceCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellIdentifier];
        [cell loadModel:model];
        return cell;
    } else if ([model isKindOfClass:KKHomeChatCellModel.class]) {
        KKHomeChatCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellIdentifier];
        [cell loadModel:model];
        return cell;
    }
    return UITableViewCell.new;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.navBarView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kNavHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    KKHomeListCellModel *model = self.dataArray[indexPath.row];
    return model.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    KKHomeListCellModel *model = self.dataArray[indexPath.row];
    if ([model isKindOfClass:KKHomeSearchCellModel.class]) {
        
    } else if ([model isKindOfClass:KKHomeNoNetworkCellModel.class]) {
        KKWebViewController *webVC = [[KKWebViewController alloc] init];
        webVC.localUrl = @"network_setting";
        [self.navigationController pushViewController:webVC animated:YES];
    } else if ([model isKindOfClass:KKHomeThridDeviceCellModel.class]) {
        
    } else if ([model isKindOfClass:KKHomeChatCellModel.class]) {
        KKChatDetailViewController *chatVC = [KKChatDetailViewController new];
        chatVC.chatModel = (KKHomeChatCellModel *)model;
        [self.navigationController pushViewController:chatVC animated:YES];
    }
}

#pragma mark - Getter -
- (void)navBarViewDidSelectMoreBtnAction {
    
    NSLog(@"=========");
}

#pragma mark - Getter -
- (UITableView *)listTableView {
    if (!_listTableView) {
        _listTableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _listTableView.dataSource = self;
        _listTableView.delegate = self;
        [_listTableView registerClass:[KKHomeSearchCell class] forCellReuseIdentifier:KKHomeSearchCellID];
        [_listTableView registerClass:[KKHomeThridDeviceCell class] forCellReuseIdentifier:KKHomeThridDeviceCellID];
        [_listTableView registerClass:[KKHomeNoNetworkCell class] forCellReuseIdentifier:KKHomeNoNetworkCellID];
        [_listTableView registerClass:[KKHomeChatCell class] forCellReuseIdentifier:KKHomeChatCellID];
        _listTableView.tableFooterView = UIView.new;
        _listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        if (@available(iOS 11.0, *)) {
            _listTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        _listTableView.backgroundColor = kBgColor;
        _listTableView.clipsToBounds = NO;
    }
    return _listTableView;
}
- (NSMutableArray<KKHomeListCellModel *> *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}
- (KKHomeNavBarView *)navBarView {
    if (!_navBarView) {
        _navBarView = [[KKHomeNavBarView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kNavHeight)];
        _navBarView.delegate = self;
    }
    return _navBarView;
}

@end
