//
//  KKHomeNavBarView.m
//  KKChat
//
//  Created by q.zhang on 2021/1/5.
//

#import "KKHomeNavBarView.h"

@interface KKHomeNavBarView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, strong) UIView *barView;
@end
@implementation KKHomeNavBarView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kBgColor;
        [self setupUI];
        [self layoutUI];
    }
    return self;
}


- (void)setupUI {
    [self addSubview:self.barView];
    [self.barView addSubview:self.titleLabel];
    [self.barView addSubview:self.moreBtn];
}
- (void)layoutUI {
    [self.barView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        make.height.mas_equalTo(44);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.barView.mas_centerX);
        make.centerY.mas_equalTo(self.barView.mas_centerY);
    }];
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.barView).offset(-10);
        make.centerY.mas_equalTo(self.barView.mas_centerY);
        make.width.height.mas_equalTo(30);
    }];
}

#pragma mark - Action -
- (void)moreBtnAction {
    if ([self.delegate respondsToSelector:@selector(navBarViewDidSelectMoreBtnAction)]) {
        [self.delegate navBarViewDidSelectMoreBtnAction];
    }
}

#pragma mark - Getter -
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = UIColor.blackColor;
        _titleLabel.font = [UIFont boldSystemFontOfSize:15];
    }
    return _titleLabel;
}

- (UIButton *)moreBtn {
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_moreBtn setImage:[UIImage svgImageName:@"icons_outlined_add2.svg" targetSize:CGSizeMake(25, 25)] forState:(UIControlStateNormal)];
        [_moreBtn addTarget:self action:@selector(moreBtnAction) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _moreBtn;
}

- (UIView *)barView {
    if (!_barView) {
        _barView = [[UIView alloc] init];
        _barView.backgroundColor = kBgColor;
    }
    return _barView;
}


@end
