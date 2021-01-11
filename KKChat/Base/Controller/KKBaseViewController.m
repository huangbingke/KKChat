//
//  KKBaseViewController.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKBaseViewController.h"

@interface KKBaseViewController ()

@end

@implementation KKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (@available(iOS 11.0, *)) {
        
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    [self setupUI];
    [self layoutUI];
    [self setNavBar];
}
- (void)setupUI {
    
}
- (void)layoutUI {
    
}
- (void)setNavBar {
    
}

- (void)dealloc {
    NSLog(@"释放了==> %@", NSStringFromClass(self.class));
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
