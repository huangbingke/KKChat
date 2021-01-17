//
//  KKIMCallVideoMsgCell.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKIMCallMsgCell.h"

@interface KKIMCallMsgCell ()

@property (nonatomic, strong) UIButton *msgBtn;
//@property (nonatomic, strong) UIView *arrowView;

@end
@implementation KKIMCallMsgCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)loadModel:(KKBaseCellModel *)baseModel {
    [super loadModel:baseModel];
}
- (void)setupUI {
    [super setupUI];
    
    
}

- (void)layoutUIForMe:(KKIMBaseModel *)baseModel {
    [super layoutUIForMe:baseModel];
    [self.msgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-kMsgLeftRightMargin);
        make.top.mas_equalTo(self.contentView.mas_top).offset(kTopBottomMargin);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-kTopBottomMargin);
        make.width.mas_equalTo(100);
    }];

}
- (void)layoutUIForOther:(KKIMBaseModel *)baseModel {
    [super layoutUIForOther:baseModel];
    self.msgBtn.backgroundColor = UIColor.whiteColor;
    [self.msgBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(kMsgLeftRightMargin);
        make.top.mas_equalTo(self.contentView.mas_top).offset(kTopBottomMargin);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-kTopBottomMargin);
        make.width.mas_equalTo(100);
    }];
}

#pragma mark - Action -
- (void)clickMsgBtnAction:(UIButton *)sender {
    
    
}
#pragma mark - Getter -
- (UIButton *)msgBtn {
    if (!_msgBtn) {
        _msgBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_msgBtn addTarget:self action:@selector(clickMsgBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.contentView addSubview:_msgBtn];
    }
    return _msgBtn;
}


@end
