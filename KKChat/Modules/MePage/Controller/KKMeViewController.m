//
//  KKMeViewController.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKMeViewController.h"
#import "KKNormalCell.h"
@interface KKMeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *meTableView;
@property (nonatomic, strong) NSMutableArray<NSArray<KKNormalCellModel *>  *> *dataArray;

@end

@implementation KKMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = kColor(0xfefefe);
    // Do any additional setup after loading the view.
}
- (void)setupUI {
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
    if (model.targetType == KKNormalCellTargetTypePay) {
        
    } else if (model.targetType == KKNormalCellTargetTypeCollection) {
        
    } else if (model.targetType == KKNormalCellTargetTypePyq) {
        
    } else if (model.targetType == KKNormalCellTargetTypeCardBag) {
        
    } else if (model.targetType == KKNormalCellTargetTypeExpression) {
        
    } else if (model.targetType == KKNormalCellTargetTypeSetting) {
        
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 12;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
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
            make.left.right.top.mas_equalTo(self.view);
            make.bottom.mas_equalTo(self.view).offset(-kTabBarHeight);
        }];
        _meTableView.tableFooterView = UIView.new;
        if (@available(iOS 11.0, *)) {
            _meTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [_meTableView registerClass:[KKNormalCell class] forCellReuseIdentifier:KKNormalCellID];
        KKNavigationBar *bar = [KKNavigationBar setupNavigationBarWithTitle:@"" rightName:@"icons_filled_camera.svg" rightAction:^{
            
        }];
        bar.backgroundColor = kColor(0xfefefe);
        _meTableView.tableHeaderView = bar;
    }
    return _meTableView;
}

- (NSMutableArray<NSArray<KKNormalCellModel *> *> *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
        KKNormalCellModel *payModel = [[KKNormalCellModel alloc] initWithName:@"支付" pic:@"" targetType:(KKNormalCellTargetTypePay)];
        KKNormalCellModel *collModel = [[KKNormalCellModel alloc] initWithName:@"收藏" pic:@"" targetType:(KKNormalCellTargetTypeCollection)];
        KKNormalCellModel *pyqModel = [[KKNormalCellModel alloc] initWithName:@"朋友圈" pic:@"" targetType:(KKNormalCellTargetTypePyqMe)];
        KKNormalCellModel *cardModel = [[KKNormalCellModel alloc] initWithName:@"卡包" pic:@"" targetType:(KKNormalCellTargetTypeCardBag)];
        KKNormalCellModel *expressionModel = [[KKNormalCellModel alloc] initWithName:@"表情" pic:@"" targetType:(KKNormalCellTargetTypeExpression)];
        KKNormalCellModel *setModel = [[KKNormalCellModel alloc] initWithName:@"设置" pic:@"" targetType:(KKNormalCellTargetTypeSetting)];
        [_dataArray addObject:@[payModel]];
        [_dataArray addObject:@[collModel, pyqModel, cardModel, expressionModel]];
        [_dataArray addObject:@[setModel]];
    }
    return _dataArray;
}


@end
