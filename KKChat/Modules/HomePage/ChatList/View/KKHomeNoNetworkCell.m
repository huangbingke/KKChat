//
//  KKHomeNoNetworkCell.m
//  KKChat
//
//  Created by KK on 2020/12/24.
//

#import "KKHomeNoNetworkCell.h"
NSString * const KKHomeNoNetworkCellID = @"KKHomeNoNetworkCellID";

@interface KKHomeNoNetworkCell ()

@property (nonatomic, strong) UIImageView *tipImageView;
@property (nonatomic, strong) UILabel *tipLabel;

@end

@implementation KKHomeNoNetworkCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupUI {
//    self.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
    self.backgroundColor = kColorRGB(255, 197, 198);
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [self.contentView addSubview:self.tipImageView];
    [self.contentView addSubview:self.tipLabel];
}

- (void)layoutUI {
    [self.tipImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(25);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.contentView).mas_offset(15);
    }];
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.tipImageView.mas_right).offset(20);
        make.centerY.mas_equalTo(self.tipImageView.mas_centerY);
    }];
}

#pragma mark - Getter -
- (UIImageView *)tipImageView {
    if (!_tipImageView) {
        _tipImageView = [[UIImageView alloc] init];
        _tipImageView.image = [UIImage svgImageName:@"icons_filled_info.svg" targetSize:CGSizeMake(30, 30) tintColor:UIColor.redColor];
    }
    return _tipImageView;
}

- (UILabel *)tipLabel {
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.text = @"当前网络不可用, 请检查你的网络设置";
        _tipLabel.textColor = kColorRGB(123, 123, 123);
        _tipLabel.font = [UIFont systemFontOfSize:12];
    }
    return _tipLabel;
}





@end
