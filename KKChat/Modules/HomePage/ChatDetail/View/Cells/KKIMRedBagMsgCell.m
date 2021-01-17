//
//  KKIMRedBagCell.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKIMRedBagMsgCell.h"

@interface KKIMRedBagMsgCell ()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) CALayer *lineLayer;//线
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *amountLabel;//金额
@property (nonatomic, strong) UILabel *remarkLabel;//转账备注
@property (nonatomic, strong) UILabel *typeLabel;//类型 微信红包-微信转账
//红包备注
@property (nonatomic, strong) UILabel *redRemarkLabel;

@end

@implementation KKIMRedBagMsgCell

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
    KKIMRedBagMsgCellModel *model = (KKIMRedBagMsgCellModel *)baseModel;
    if (model.isMe) {
        [self layoutUIForMe:model];
    } else {
        [self layoutUIForOther:model];
    }
    
    if (model.transferType == KKIMMsgTransferTypeTransfer) {
        self.typeLabel.text = @"微信转账";
    } else {
        self.typeLabel.text = @"微信红包";
    }
    
    if (model.isReceive) {
        self.arrowView.backgroundColor = kColor(0xf8e0c4);
        self.bgView.backgroundColor = kColor(0xf8e0c4);
        if (model.transferType == KKIMMsgTransferTypeTransfer) {
            self.amountLabel.text = [NSString stringWithFormat:@"￥%.2f", model.amount];
            self.remarkLabel.text = model.remark;
            self.iconImageView.image = [UIImage svgImageName:@""];
        } else {
            self.amountLabel.text = [NSString stringWithFormat:@"%@", model.remark];
            self.remarkLabel.text = @"已被领完";
            self.iconImageView.image = [UIImage svgImageName:@""];
        }
    } else {
        self.arrowView.backgroundColor = kColor(0xf09c50);
        self.bgView.backgroundColor = kColor(0xf09c50);
        if (model.transferType == KKIMMsgTransferTypeTransfer) {
            self.amountLabel.text = [NSString stringWithFormat:@"￥%.2f", model.amount];
            self.remarkLabel.text = model.remark;
            self.iconImageView.image = [UIImage svgImageName:@""];
        } else {
            self.iconImageView.image = [UIImage svgImageName:@""];
            if (model.remark && model.remark.length > 0) {
                self.redRemarkLabel.text = model.remark;
            } else {
                self.redRemarkLabel.text = @"恭喜发财, 大吉大利";
            }
        }
    }
}
- (void)setupUI {
    [super setupUI];
    
    
}


- (void)layoutUIForMe:(KKIMRedBagMsgCellModel *)baseModel {
    [super layoutUIForMe:baseModel];
    [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-kMsgLeftRightMargin);
        make.top.mas_equalTo(self.contentView.mas_top).offset(kTopBottomMargin);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-kTopBottomMargin);
        make.left.mas_equalTo(self.contentView.mas_left).offset(kMsgLeftRightMargin+30);
    }];
    [self setPublicSubView:baseModel];
}
- (void)layoutUIForOther:(KKIMRedBagMsgCellModel *)baseModel {
    [super layoutUIForOther:baseModel];
    [self.bgView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(kMsgLeftRightMargin);
        make.top.mas_equalTo(self.contentView.mas_top).offset(kTopBottomMargin);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-kTopBottomMargin);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-kMsgLeftRightMargin-30);
    }];
    [self setPublicSubView:baseModel];
}

- (void)setPublicSubView:(KKIMRedBagMsgCellModel *)baseModel {
    [self.bgView.layer addSublayer:self.lineLayer];
    [self.iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.bgView).offset(12);
        make.width.height.mas_equalTo(28);
    }];
    [self.typeLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.bgView.mas_left).offset(12);
        make.right.mas_equalTo(self.bgView.mas_right).offset(5);
        make.bottom.mas_equalTo(self.bgView.mas_bottom).offset(-3);
    }];
    if (!baseModel.isReceive) {
        if (baseModel.transferType == KKIMMsgTransferTypeTransfer) {
            [self.amountLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.iconImageView.mas_right).offset(10);
                make.top.mas_equalTo(self.bgView).offset(12);
                make.height.mas_equalTo(15);
                make.right.mas_equalTo(self.bgView).offset(-12);
            }];
            [self.remarkLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.iconImageView.mas_right).offset(15);
                make.top.mas_equalTo(self.bgView).offset(30);
                make.right.mas_equalTo(self.bgView).offset(-12);
            }];
        } else {
            [self.redRemarkLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.iconImageView.mas_right).offset(10);
                make.centerY.mas_equalTo(self.iconImageView.mas_centerY);
                make.right.mas_equalTo(self.bgView).offset(-12);
            }];
        }
    } else {
        [self.amountLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconImageView.mas_right).offset(10);
            make.top.mas_equalTo(self.bgView).offset(12);
            make.height.mas_equalTo(25);
            make.right.mas_equalTo(self.bgView).offset(-12);
        }];
        [self.redRemarkLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconImageView.mas_right).offset(10);
            make.top.mas_equalTo(self.bgView).offset(30);
            make.right.mas_equalTo(self.bgView).offset(-12);
        }];
    }
}




#pragma mark - Getter -
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        [self.contentView addSubview:_bgView];
        _bgView.layer.cornerRadius = kCornerRadius;
        _bgView.layer.masksToBounds = YES;
    }
    return _bgView;
}
- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.backgroundColor = UIColor.redColor;
        [_bgView addSubview:_iconImageView];
    }
    return _iconImageView;
}

- (UILabel *)amountLabel {
    if (!_amountLabel) {
        _amountLabel = [[UILabel alloc] init];
        _amountLabel.textColor = UIColor.whiteColor;
        _amountLabel.font = [UIFont systemFontOfSize:14];
        [_bgView addSubview:_amountLabel];
    }
    return _amountLabel;
}
- (UILabel *)typeLabel {
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc] init];
        _typeLabel.textColor = UIColor.whiteColor;
        _typeLabel.font = [UIFont systemFontOfSize:10];
        [_bgView addSubview:_typeLabel];
    }
    return _typeLabel;
}
- (UILabel *)remarkLabel {
    if (!_remarkLabel) {
        _remarkLabel = [[UILabel alloc] init];
        _remarkLabel.textColor = UIColor.whiteColor;
        _remarkLabel.font = [UIFont systemFontOfSize:8];
        [_bgView addSubview:_remarkLabel];

    }
    return _remarkLabel;
}

- (UILabel *)redRemarkLabel {
    if (!_redRemarkLabel) {
        _redRemarkLabel = [[UILabel alloc] init];
        _redRemarkLabel.textColor = UIColor.whiteColor;
        _redRemarkLabel.font = [UIFont systemFontOfSize:15];
        [_bgView addSubview:_redRemarkLabel];
    }
    return _redRemarkLabel;
}

- (CALayer *)lineLayer {
    if (!_lineLayer) {
        _lineLayer = [CALayer layer];
        _lineLayer.backgroundColor = kColor(0xdcdddf).CGColor;
        CGFloat width = kScreenWidth-kMsgLeftRightMargin*2-15-45;
        _lineLayer.frame = CGRectMake(15, 48, width, 0.15);
    }
    return _lineLayer;
}

@end
