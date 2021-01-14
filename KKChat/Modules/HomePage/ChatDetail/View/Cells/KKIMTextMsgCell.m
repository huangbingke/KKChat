//
//  KKIMTextCell.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKIMTextMsgCell.h"
#import <YYText.h>
@interface KKIMTextMsgCell ()

@property (nonatomic, strong) UIImageView *bgImageView;
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

- (void)setupUI {
    [super setupUI];
    
}

- (void)loadModel:(KKIMBaseModel *)baseModel {
    [super loadModel:baseModel];
    if (baseModel.isMe) {
        
    }
}

- (void)layoutUIForMe {
    [super layoutUIForMe];
    self.bgImageView.image = [UIImage svgImageName:@"chat_right_qipao.svg" targetSize:CGSizeMake(36, 36)];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.headBtn.mas_left).offset(-5);
        make.top.mas_equalTo(self.contentView.mas_top).offset(12);
//        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-12);
    }];
    [self.textMsgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(self.bgImageView).offset(-10);
        make.left.top.mas_equalTo(self.bgImageView).offset(10);
    }];
}
- (void)layoutUIForOther {
    [super layoutUIForOther];
    self.bgImageView.image = [UIImage svgImageName:@"chat_left_qipao.svg"];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headBtn.mas_right).offset(5);
        make.top.mas_equalTo(self.contentView.mas_top).offset(12);
//        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-12);
    }];
    [self.textMsgLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.mas_equalTo(self.bgImageView).offset(-10);
        make.left.top.mas_equalTo(self.bgImageView).offset(10);
    }];
}

#pragma mark - Getter -
- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] init];
//        _bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_bgImageView];
    }
    return _bgImageView;
}

- (YYLabel *)textMsgLabel {
    if (!_textMsgLabel) {
        _textMsgLabel = [[YYLabel alloc] init];
        _textMsgLabel.font = [UIFont systemFontOfSize:14];
        _textMsgLabel.text = @"哈哈哈";
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
