//
//  KKIMBaseCell.m
//  KKChat
//
//  Created by q.zhang on 2021/1/13.
//

#import "KKIMBaseCell.h"

@interface KKIMBaseCell ()


@end

@implementation KKIMBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupUI {
    self.backgroundColor = kRandomColor;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

- (void)loadModel:(KKIMBaseModel *)baseModel {

    self.textLabel.text = baseModel.cellIdentifier;
}

- (UIButton *)selectBtn {
    if (!_selectBtn) {
        _selectBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _selectBtn.userInteractionEnabled = NO;
        [_selectBtn setImage:[UIImage svgImageName:@"" targetSize:CGSizeMake(35, 35)] forState:(UIControlStateNormal)];
        [_selectBtn setImage:[UIImage svgImageName:@"" targetSize:CGSizeMake(35, 35)] forState:(UIControlStateSelected)];
        [self.contentView addSubview:_selectBtn];
        [_selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView).offset(10);
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.width.height.mas_equalTo(35);
        }];
    }
    return _selectBtn;
}








@end
