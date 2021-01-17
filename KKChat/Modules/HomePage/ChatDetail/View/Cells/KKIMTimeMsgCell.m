//
//  KKIMTimeCell.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKIMTimeMsgCell.h"

@interface KKIMTimeMsgCell ()

@property (nonatomic, strong) UILabel *dateLabel;

@end
@implementation KKIMTimeMsgCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)loadModel:(KKBaseCellModel *)baseModel {
    if ([baseModel isKindOfClass:KKIMTimeMsgCellModel.class]) {
        KKIMTimeMsgCellModel *model = (KKIMTimeMsgCellModel *)baseModel;
        self.dateLabel.text = model.showDate;
    }
}
- (void)setupUI {
    [super setupUI];
    [self.contentView addSubview:self.dateLabel];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
//        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-kTopBottomMargin);
    }];
}

#pragma mark - Getter -
- (UILabel *)dateLabel {
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.textColor = kColor(0xcfcfcf);
        _dateLabel.font = [UIFont systemFontOfSize:12];
    }
    return _dateLabel;
}


@end
