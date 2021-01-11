//
//  KKMeViewController.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKMeViewController.h"
#import "KKMeTopCell.h"
@interface KKMeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *meTableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

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
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCell.new;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
#pragma mark - Getter -
- (UITableView *)meTableView {
    if (!_meTableView) {
        _meTableView = [[UITableView alloc] initWithFrame:CGRectZero style:(UITableViewStylePlain)];
        _meTableView.dataSource = self;
        _meTableView.delegate = self;
        _meTableView.backgroundColor = kColor(0xebebeb);
        _meTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_meTableView];
        [_meTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.top.mas_equalTo(self.view);
        }];
        _meTableView.tableFooterView = UIView.new;
        if (@available(iOS 11.0, *)) {
            _meTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        [_meTableView registerClass:[KKMeTopCell class] forCellReuseIdentifier:KKMeTopCellID];
        _meTableView.tableHeaderView = [KKNavigationBar setupNavigationBarWithTitle:@"" rightName:@"icons_filled_camera.svg" rightAction:^{
            
        }];
        self.kkNavigationBar.backgroundColor = kColor(0xfefefe);
        self.kkNavigationBar.lineLayer.backgroundColor = [UIColor clearColor].CGColor;
    }
    return _meTableView;
}



@end
