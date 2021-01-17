//
//  KKIMTextCell.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKIMTextMsgCell.h"
#import <YYText.h>

@interface KKIMTextMsgCell ()

@property (nonatomic, strong) YYLabel *textMsgLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *errorBtn;

@end
@implementation KKIMTextMsgCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadModel:(KKIMBaseModel *)baseModel {
    KKIMTextMsgCellModel *model = (KKIMTextMsgCellModel *)baseModel;
    self.textMsgLabel.attributedText = model.contentAttributedText;
    if (model.isMe) {
        [self layoutUIForMe:model];
    } else {
        [self layoutUIForOther:model];
    }
}

- (void)layoutUIForMe:(KKIMTextMsgCellModel *)baseModel {
    [super layoutUIForMe:baseModel];
    self.textMsgLabel.backgroundColor = kColor(0x7fe967);
    if (baseModel.cellHeight <= 60) {
        [self.textMsgLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).offset(-kMsgLeftRightMargin);
            make.left.mas_equalTo(self.contentView.mas_left).offset(kScreenWidth-(74+baseModel.oneLineWidth));
            make.top.mas_equalTo(self.contentView.mas_top).offset(kTopBottomMargin);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-kTopBottomMargin);
        }];
    } else {
        [self.textMsgLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).offset(-kMsgLeftRightMargin);
            make.left.mas_equalTo(self.contentView.mas_left).offset(kMsgLeftRightMargin);
            make.top.mas_equalTo(self.contentView.mas_top).offset(kTopBottomMargin);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-kTopBottomMargin);
        }];
    }
}
- (void)layoutUIForOther:(KKIMTextMsgCellModel *)baseModel {
    [super layoutUIForOther:baseModel];
    self.textMsgLabel.backgroundColor = UIColor.whiteColor;
    if (baseModel.cellHeight <= 60) {
        [self.textMsgLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).offset(kMsgLeftRightMargin);
            make.right.mas_equalTo(self.contentView.mas_right).offset(74+baseModel.oneLineWidth- kScreenWidth);
            make.top.mas_equalTo(self.contentView.mas_top).offset(kTopBottomMargin);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-kTopBottomMargin);
        }];
    } else {
        [self.textMsgLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).offset(kMsgLeftRightMargin);
            make.right.mas_equalTo(self.contentView.mas_right).offset(-kMsgLeftRightMargin);
            make.top.mas_equalTo(self.contentView.mas_top).offset(kTopBottomMargin);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-kTopBottomMargin);
        }];
    }
}

#pragma mark - Action -
- (void)longGestureAction:(UILongPressGestureRecognizer *)sender {
    NSLog(@"long Gesture");
}

#pragma mark - Getter -
- (YYLabel *)textMsgLabel {
    if (!_textMsgLabel) {
        _textMsgLabel = [[YYLabel alloc] init];
        _textMsgLabel.font = [UIFont systemFontOfSize:KKIMTextMsgFont];
        _textMsgLabel.numberOfLines = 0;
        _textMsgLabel.layer.masksToBounds = YES;
        _textMsgLabel.layer.cornerRadius = kCornerRadius;
        _textMsgLabel.textContainerInset = UIEdgeInsetsMake(5, 8, 5, 5);
        __block int i = 0;
        [_textMsgLabel setTextTapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            i++;
            if (i == 2) {
                i = 0;
                NSLog(@"=======> 双击");
            }
        }];
        UILongPressGestureRecognizer *longGest = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longGestureAction:)];
        longGest.minimumPressDuration = 1.5;
        [_textMsgLabel addGestureRecognizer: longGest];
        [self.contentView addSubview:_textMsgLabel];
    }
    return _textMsgLabel;
}
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}


@end
