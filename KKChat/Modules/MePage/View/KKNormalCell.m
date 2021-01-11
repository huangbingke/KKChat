//
//  KKNormalCell.m
//  KKChat
//
//  Created by q.zhang on 2021/1/11.
//

#import "KKNormalCell.h"
NSString * const KKNormalCellID = @"KKNormalCellID";
@interface KKNormalCell ()

@property (nonatomic, strong) UIImageView *picImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *arrowImageView;

@end

@implementation KKNormalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupUI {
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(60, 49.5, kScreenWidth-60, 0.5);
    layer.backgroundColor = kBgColor.CGColor;
    [self.contentView.layer addSublayer:layer];
    
    [self picImageView];
    [self titleLabel];
    [self arrowImageView];


}

- (void)setCellModel:(KKNormalCellModel *)cellModel {
    _cellModel = cellModel;
//    _picImageView.image = [UIImage svgImageName:cellModel.pic];
    _titleLabel.text = cellModel.name;
}


#pragma mark - Getter -
- (UIImageView *)picImageView {
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.backgroundColor = [UIColor redColor];
        [self addSubview:_picImageView];
        [_picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.mas_left).offset(10);
            make.top.mas_equalTo(self.mas_top).offset(15/2);
            make.width.height.mas_equalTo(35);
        }];
    }
    return _picImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.picImageView.mas_centerY);
            make.left.mas_equalTo(self.picImageView.mas_right).offset(10);
        }];
    }
    return _titleLabel;
}

- (UIImageView *)arrowImageView {
    if (!_arrowImageView) {
        _arrowImageView = [[UIImageView alloc] init];
//        _arrowImageView.image = [UIImage svgImageName:@""];
        [self.contentView addSubview:_arrowImageView];
        [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).offset(-10);
            make.centerY.mas_equalTo(self.picImageView.mas_centerY);
            make.width.height.mas_equalTo(25);
        }];
    }
    return _arrowImageView;
}






@end
