//
//  KKChatDetailViewController.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKChatDetailViewController.h"
#import "KKChatTableView.h"
@interface KKChatDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) KKChatTableView *chatTableView;


@end

@implementation KKChatDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
}


#pragma mark - UITableViewDelegate, UITableViewDataSource -
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    return UITableViewCell.new;
}


#pragma mark - Getter -
- (KKChatTableView *)chatTableView {
    if (!_chatTableView) {
        _chatTableView = [[KKChatTableView alloc] initWithFrame:CGRectZero style:(UITableViewStyleGrouped)];
        _chatTableView.dataSource = self;
        _chatTableView.delegate = self;
        _chatTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _chatTableView;
}


@end
