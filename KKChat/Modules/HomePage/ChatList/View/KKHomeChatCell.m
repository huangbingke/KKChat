//
//  KKHomeChatCell.m
//  KKChat
//
//  Created by KK on 2020/12/24.
//

#import "KKHomeChatCell.h"
NSString * const KKHomeChatCellID = @"KKHomeChatCellID";


@interface KKHomeChatCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UIImageView *disturbImageView; //免打扰图标
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UILabel *messageCountLabel;
@property (nonatomic, strong) UILabel *dateLabel;


@end
@implementation KKHomeChatCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadModel:(KKBaseCellModel *)baseModel {
    if ([baseModel isKindOfClass:KKHomeChatCellModel.class]) {
        KKHomeChatCellModel *model = (KKHomeChatCellModel *)baseModel;
        if (model.isDisturb) {
            [self.disturbImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self.contentView).mas_offset(-15);
                make.right.mas_equalTo(self.contentView).mas_offset(-15);
                make.width.height.mas_equalTo(15);
                
            }];
            [self.messageLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(self.contentView).mas_offset(-15);
                make.left.mas_equalTo(self.headImageView.mas_right).mas_offset(10);
                make.right.mas_equalTo(self.disturbImageView.mas_left).mas_offset(-10);
            }];
        }
        
        self.nameLabel.text = model.nickName;
        [self.headImageView sd_setImageWithURL: [NSURL URLWithString:model.headUrl]];
        self.dateLabel.text = model.date;
        self.messageLabel.text = model.message;
    }
}

- (void)setupUI {
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.messageLabel];
    [self.contentView addSubview:self.dateLabel];
    [self.contentView addSubview:self.disturbImageView];
}

- (void)layoutUI {
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(44);
        make.left.mas_equalTo(self.contentView).offset(15);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(15);
        make.right.mas_equalTo(self.contentView).mas_offset(-15);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(20);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).mas_offset(15);
        make.right.mas_equalTo(self.dateLabel.mas_left).mas_offset(-15);
        make.left.mas_equalTo(self.headImageView.mas_right).mas_offset(10);
    }];
        
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.contentView).mas_offset(-15);
        make.left.mas_equalTo(self.headImageView.mas_right).mas_offset(10);
        make.right.mas_equalTo(self.contentView).mas_offset(-15);
    }];
}

#pragma mark - Getter -
- (UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc] init];
        _headImageView.backgroundColor = kColorRGB(236, 236, 236);
    }
    return _headImageView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
    }
    return _nameLabel;
}

- (UILabel *)messageLabel {
    if (!_messageLabel) {
        _messageLabel = [[UILabel alloc] init];
        _messageLabel.textColor = kColorRGB(123, 123, 123);
        _messageLabel.font = [UIFont systemFontOfSize:12];
    }
    return _messageLabel;
}

- (UILabel *)dateLabel {
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.textColor = kColorRGB(123, 123, 123);
        _dateLabel.font = [UIFont systemFontOfSize:12];
    }
    return _dateLabel;
}

- (UIImageView *)disturbImageView {
    if (!_disturbImageView) {
        _disturbImageView = [[UIImageView alloc] init];
        _disturbImageView.image = [UIImage imageNamed:@""];
    }
    return _disturbImageView;
}


@end
