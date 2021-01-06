//
//  KKHomeThridDeviceCell.m
//  KKChat
//
//  Created by KK on 2020/12/24.
//

#import "KKHomeThridDeviceCell.h"
NSString * const KKHomeThridDeviceCellID = @"KKHomeThridDeviceCellID";

@interface KKHomeThridDeviceCell ()

@property (nonatomic, strong) UIImageView *deviceImageView;
@property (nonatomic, strong) UILabel *tipLabel;

@end

@implementation KKHomeThridDeviceCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)loadModel:(KKBaseCellModel *)baseModel {
    if ([baseModel isKindOfClass:KKHomeThridDeviceCellModel.class]) {
        KKHomeThridDeviceCellModel *model = (KKHomeThridDeviceCellModel *)baseModel;
        self.deviceImageView.image = [UIImage svgImageName:model.deviceImageName targetSize:CGSizeMake(25, 25) tintColor:kColor(0xc1c1c1)];
        self.tipLabel.text = model.tip;
    }
}

- (void)setupUI {
    [self.contentView addSubview:self.deviceImageView];
    [self.contentView addSubview:self.tipLabel];
}
- (void)layoutUI {
    [self.deviceImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(20);
        make.width.height.mas_equalTo(25);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.deviceImageView.mas_right).offset(15);
    }];
    
}


#pragma mark - Getter -
- (UIImageView *)deviceImageView {
    if (!_deviceImageView) {
        _deviceImageView = [[UIImageView alloc] init];
    }
    return _deviceImageView;
}

- (UILabel *)tipLabel {
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.textColor = kColorRGB(123, 123, 123);
        _tipLabel.font = [UIFont systemFontOfSize:13];
    }
    return _tipLabel;
}




@end
