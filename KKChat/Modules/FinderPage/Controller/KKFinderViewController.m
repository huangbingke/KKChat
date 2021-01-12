//
//  KKFinderViewController.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKFinderViewController.h"
#import "KKNormalCell.h"
@interface KKFinderViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *meTableView;
@property (nonatomic, strong) NSMutableArray<NSArray<KKNormalCellModel *>  *> *dataArray;

@end

@implementation KKFinderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kColor(0xfefefe);
    // Do any additional setup after loading the view.
}
- (void)setupUI {
    self.kkNavigationBar = [KKNavigationBar setupNavigationBarWithTitle:@"发现"];
    self.kkNavigationBar.backgroundColor = kColor(0xeeeeee);
    [self.meTableView reloadData];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray[section].count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KKNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:KKNormalCellID forIndexPath:indexPath];
    cell.cellModel = self.dataArray[indexPath.section][indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    KKNormalCellModel *model = self.dataArray[indexPath.section][indexPath.row];
    if (model.targetType == KKNormalCellTargetTypePyq) {
        
    } else if (model.targetType == KKNormalCellTargetTypeVodie) {
        
    } else if (model.targetType == KKNormalCellTargetTypeScan) {
        
    } else if (model.targetType == KKNormalCellTargetTypeShake) {
        
    } else if (model.targetType == KKNormalCellTargetTypeWatch) {
        
    } else if (model.targetType == KKNormalCellTargetTypeSearch) {
        
    } else if (model.targetType == KKNormalCellTargetTypeNear) {
        
    } else if (model.targetType == KKNormalCellTargetTypeShop) {
        
    } else if (model.targetType == KKNormalCellTargetTypeGame) {
        
    } else if (model.targetType == KKNormalCellTargetTypeApp) {
        
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 12;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return UIView.new;
}
#pragma mark - Getter -
- (UITableView *)meTableView {
    if (!_meTableView) {
        _meTableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _meTableView.dataSource = self;
        _meTableView.delegate = self;
        _meTableView.backgroundColor = kColor(0xeeeeee);
        _meTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_meTableView];
        [_meTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).offset(kNavHeight);
            make.left.right.mas_equalTo(self.view);
            make.bottom.mas_equalTo(self.view).offset(-kTabBarHeight);
        }];
        _meTableView.tableFooterView = UIView.new;
        if (@available(iOS 11.0, *)) {
            _meTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [_meTableView registerClass:[KKNormalCell class] forCellReuseIdentifier:KKNormalCellID];
    }
    return _meTableView;
}

- (NSMutableArray<NSArray<KKNormalCellModel *> *> *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
        KKNormalCellModel *pyqModel = [[KKNormalCellModel alloc] initWithName:@"朋友圈" image:[UIImage svgImageName:@""] targetType:(KKNormalCellTargetTypePyq)];
        KKNormalCellModel *vedioModel = [[KKNormalCellModel alloc] initWithName:@"视频号" image:[UIImage svgImageName:@""] targetType:(KKNormalCellTargetTypeVodie)];
        KKNormalCellModel *scanModel = [[KKNormalCellModel alloc] initWithName:@"扫一扫" image:[UIImage svgImageName:@""] targetType:(KKNormalCellTargetTypeScan)];
        KKNormalCellModel *shakeModel = [[KKNormalCellModel alloc] initWithName:@"摇一摇" image:[UIImage svgImageName:@""] targetType:(KKNormalCellTargetTypeShake)];
        KKNormalCellModel *watchModel = [[KKNormalCellModel alloc] initWithName:@"看一看" image:[UIImage svgImageName:@""] targetType:(KKNormalCellTargetTypeWatch)];
        KKNormalCellModel *searchModel = [[KKNormalCellModel alloc] initWithName:@"搜一搜" image:[UIImage svgImageName:@""] targetType:(KKNormalCellTargetTypeSearch)];
        KKNormalCellModel *nearModel = [[KKNormalCellModel alloc] initWithName:@"附近的直播和人" image:[UIImage svgImageName:@""] targetType:(KKNormalCellTargetTypeNear)];
        KKNormalCellModel *shopModel = [[KKNormalCellModel alloc] initWithName:@"购物" image:[UIImage svgImageName:@""] targetType:(KKNormalCellTargetTypeShop)];
        KKNormalCellModel *gameModel = [[KKNormalCellModel alloc] initWithName:@"游戏" image:[UIImage svgImageName:@""] targetType:(KKNormalCellTargetTypeGame)];
        KKNormalCellModel *appModel = [[KKNormalCellModel alloc] initWithName:@"小程序" image:[UIImage svgImageName:@""] targetType:(KKNormalCellTargetTypeApp)];
        [_dataArray addObject:@[pyqModel]];
        [_dataArray addObject:@[vedioModel]];
        [_dataArray addObject:@[scanModel, shakeModel]];
        [_dataArray addObject:@[watchModel, searchModel]];
        [_dataArray addObject:@[nearModel]];
        [_dataArray addObject:@[shopModel, gameModel]];
        [_dataArray addObject:@[appModel]];
    }
    return _dataArray;
}

@end
