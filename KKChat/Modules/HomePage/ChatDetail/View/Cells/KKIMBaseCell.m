//
//  KKIMBaseCell.m
//  KKChat
//
//  Created by q.zhang on 2021/1/13.
//

#import "KKIMBaseCell.h"

NSString * const KKIMCellMsgLongPressGestureNotificationName = @"KKIMCellMsgLongPressGestureNotificationName";

@interface KKIMBaseCell ()
//群聊显示姓名
@property (nonatomic, strong) UILabel *nameLabel;

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
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}

- (void)layoutUIForMe:(KKIMBaseModel *)baseModel {
    [self.headBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-12);
        make.top.mas_equalTo(self.contentView.mas_top).offset(kTopBottomMargin);
        make.width.height.mas_equalTo(36);
    }];
    if ([[self showArrowViewClass] containsObject:NSStringFromClass(baseModel.class)]) {
        self.arrowView.backgroundColor = kColor(0x7fe967);
        [self.arrowView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).offset(-53);
            make.top.mas_equalTo(self.contentView.mas_top).offset(kTopBottomMargin+36/2-12/2);
            make.width.mas_equalTo(8);
            make.height.mas_equalTo(12);
        }];
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(0, 0)];
        [path addLineToPoint:CGPointMake(0, 12)];
        [path addLineToPoint:CGPointMake(6, 6)];
        [path closePath];
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path.CGPath;
        self.arrowView.layer.mask = layer;
    }
}
- (void)layoutUIForOther:(KKIMBaseModel *)baseModel {
    [self.headBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(12);
        make.top.mas_equalTo(self.contentView.mas_top).offset(kTopBottomMargin);
        make.width.height.mas_equalTo(36);
    }];
    
    if ([[self showArrowViewClass] containsObject:NSStringFromClass(baseModel.class)]) {
        self.arrowView.backgroundColor = UIColor.whiteColor;
        [self.arrowView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.contentView.mas_left).offset(53);
            make.top.mas_equalTo(self.contentView.mas_top).offset(kTopBottomMargin+36/2-12/2);
            make.width.mas_equalTo(8);
            make.height.mas_equalTo(12);
        }];
        UIBezierPath *path = [UIBezierPath bezierPath];
        [path moveToPoint:CGPointMake(2, 6)];
        [path addLineToPoint:CGPointMake(8, 0)];
        [path addLineToPoint:CGPointMake(8, 12)];
        [path closePath];
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.path = path.CGPath;
        self.arrowView.layer.mask = layer;
    }
}


#pragma mark - Action -
- (void)clickHeadAction:(UIButton *)sender {
    
    
}

//展示消息三角箭头的类
- (NSArray *)showArrowViewClass {
    NSArray *classes = @[@"KKIMTextMsgCellModel", @"KKIMCallMsgCellModel", @"KKIMRedBagMsgCellModel"];
    return classes;
}

#pragma mark - Getter -
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

- (UIButton *)loadingBtn {
    if (!_loadingBtn) {
        _loadingBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loadingBtn setImage:[UIImage svgImageName:@"icons_outlined_loading_light.svg" targetSize:CGSizeMake(25, 25)] forState:(UIControlStateNormal)];
        [self.contentView addSubview:_loadingBtn];
    }
    return _loadingBtn;
}

- (UIButton *)headBtn {
    if (!_headBtn) {
        _headBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_headBtn addTarget:self action:@selector(clickHeadAction:) forControlEvents:(UIControlEventTouchUpInside)];
        _headBtn.backgroundColor = kRandomColor;
        [self.contentView addSubview:_headBtn];
        _headBtn.layer.cornerRadius = kCornerRadius;
        _headBtn.layer.masksToBounds = YES;
    }
    return _headBtn;
}

- (UIView *)arrowView {
    if (!_arrowView) {
        _arrowView = [[UIView alloc] init];
        [self.contentView addSubview:_arrowView];
    }
    return _arrowView;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}
@end
