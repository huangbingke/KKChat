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

#pragma mark - Getter -
- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] init];
    }
    return _bgImageView;
}

- (YYLabel *)textMsgLabel {
    if (!_textMsgLabel) {
        _textMsgLabel = [[YYLabel alloc] init];
    }
    return _textMsgLabel;
}
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
    }
    return _nameLabel;
}

@end
