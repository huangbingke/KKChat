//
//  KKIMBaseCell.m
//  KKChat
//
//  Created by q.zhang on 2021/1/13.
//

#import "KKIMBaseCell.h"

NSString * const KKIMCellMsgLongPressGestureNotificationName = @"KKIMCellMsgLongPressGestureNotificationName";
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
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
}
- (void)loadModel:(KKIMBaseModel *)baseModel {

    
}

- (void)layoutUIForMe:(KKIMBaseModel *)baseModel {
    [self.headBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-12);
        make.top.mas_equalTo(self.contentView.mas_top).offset(12);
        make.width.height.mas_equalTo(36);
    }];
}
- (void)layoutUIForOther:(KKIMBaseModel *)baseModel {
    [self.headBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(12);
        make.top.mas_equalTo(self.contentView.mas_top).offset(12);
        make.width.height.mas_equalTo(36);
    }];
}


#pragma mark - Action -
- (void)clickHeadAction:(UIButton *)sender {
    
    
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
        [_headBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).offset(-12);
            make.top.mas_equalTo(self.contentView.mas_top).offset(12);
            make.width.height.mas_equalTo(36);
        }];
        _headBtn.layer.cornerRadius = 5;
        _headBtn.layer.masksToBounds = YES;
    }
    return _headBtn;
}

//- (UIButton *)rightHeadBtn {
//    if (!_rightHeadBtn) {
//        _rightHeadBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
//        [_rightHeadBtn addTarget:self action:@selector(clickHeadAction:) forControlEvents:(UIControlEventTouchUpInside)];
//        _rightHeadBtn.backgroundColor = kRandomColor;
//        [self.contentView addSubview:_rightHeadBtn];
//        [_rightHeadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.right.mas_equalTo(self.contentView.mas_right).offset(-12);
//            make.top.mas_equalTo(self.contentView.mas_top).offset(12);
//            make.width.height.mas_equalTo(36);
//        }];
//        _rightHeadBtn.layer.cornerRadius = 5;
//        _rightHeadBtn.layer.masksToBounds = YES;
//    }
//    return _rightHeadBtn;
//}
//- (UIButton *)leftHeadBtn {
//    if (!_leftHeadBtn) {
//        _leftHeadBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
//        [_leftHeadBtn addTarget:self action:@selector(clickHeadAction:) forControlEvents:(UIControlEventTouchUpInside)];
//        _leftHeadBtn.backgroundColor = kRandomColor;
//        [self.contentView addSubview:_leftHeadBtn];
//        [_leftHeadBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.left.mas_equalTo(self.contentView.mas_left).offset(12);
//            make.top.mas_equalTo(self.contentView.mas_top).offset(12);
//            make.width.height.mas_equalTo(36);
//        }];
//        _leftHeadBtn.layer.cornerRadius = 5;
//        _leftHeadBtn.layer.masksToBounds = YES;
//    }
//    return _leftHeadBtn;
//}


@end
