//
//  KKIMCallVideoMsgCell.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKIMCallMsgCell.h"
#import "UIButton+Category.h"
@interface KKIMCallMsgCell ()

@property (nonatomic, strong) UIButton *msgBtn;
//@property (nonatomic, strong) UIView *arrowView;

@end
@implementation KKIMCallMsgCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)loadModel:(KKBaseCellModel *)baseModel {
    [super loadModel:baseModel];
    KKIMCallMsgCellModel *model = (KKIMCallMsgCellModel *)baseModel;
    
    if (model.callType == KKIMCallTypeVoice) {
        if (model.status == KKIMCallStatusCalling) {
            [self.msgBtn setImage:[UIImage svgImageName:@"icons_filled_call.svg" targetSize:CGSizeMake(20, 20)] forState:(UIControlStateNormal)];
        } else {
            [self.msgBtn setImage:[UIImage svgImageName:@"icons_filled_call_end.svg" targetSize:CGSizeMake(20, 20)] forState:(UIControlStateNormal)];
        }
    } else {
        [self.msgBtn setImage:[UIImage svgImageName:@"icons_filled_video_call.svg" targetSize:CGSizeMake(20, 20)] forState:(UIControlStateNormal)];
    }
        
    if (model.status == KKIMCallStatusCancel) {
        [self.msgBtn setTitle: model.isMe ? @"已取消": @"对方已取消" forState:(UIControlStateNormal)];
    } else if (model.status == KKIMCallStatusCalling) {
        [self.msgBtn setTitle: @"通话中" forState:(UIControlStateNormal)];
    } else if (model.status == KKIMCallStatusFailed) {
        [self.msgBtn setTitle:@"无法连接" forState:(UIControlStateNormal)];
    } else if (model.status == KKIMCallStatusReject) {
        [self.msgBtn setTitle: model.isMe ? @"已拒绝": @"对方已拒绝" forState:(UIControlStateNormal)];
    } else if (model.status == KKIMCallStatusEnd) {
        [self.msgBtn setTitle:[NSString stringWithFormat:@"通话时长 %.f:%ld", model.duration/60, (NSInteger)model.duration%60] forState:(UIControlStateNormal)];
    }
    self.msgBtn.isSizeToFit = YES;
    if (model.isMe) {
        [self layoutUIForMe: model];
        [self.msgBtn setImageLayout:(UIButtonLayoutTypeImageRight) space:10];
    } else {
        [self layoutUIForOther:model];
        [self.msgBtn setImageLayout:(UIButtonLayoutTypeImageLeft) space:10];
    }
}
- (void)setupUI {
    [super setupUI];
    
    
}

- (void)layoutUIForMe:(KKIMCallMsgCellModel *)baseModel {
    [super layoutUIForMe:baseModel];
    self.msgBtn.backgroundColor = kColor(0x7fe967);
    [self.msgBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-kMsgLeftRightMargin);
        make.top.mas_equalTo(self.contentView.mas_top).offset(kTopBottomMargin);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-kTopBottomMargin);
        make.width.mas_equalTo(baseModel.width);
    }];

}
- (void)layoutUIForOther:(KKIMCallMsgCellModel *)baseModel {
    [super layoutUIForOther:baseModel];
    self.msgBtn.backgroundColor = UIColor.whiteColor;
    [self.msgBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(kMsgLeftRightMargin);
        make.top.mas_equalTo(self.contentView.mas_top).offset(kTopBottomMargin);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-kTopBottomMargin);
        make.width.mas_equalTo(baseModel.width);
    }];
}

#pragma mark - Action -
- (void)clickMsgBtnAction:(UIButton *)sender {
    
    
}
#pragma mark - Getter -
- (UIButton *)msgBtn {
    if (!_msgBtn) {
        _msgBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_msgBtn addTarget:self action:@selector(clickMsgBtnAction:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.contentView addSubview:_msgBtn];
        _msgBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        _msgBtn.layer.cornerRadius = kCornerRadius;
        _msgBtn.layer.masksToBounds = YES;
        [_msgBtn setTitleColor:UIColor.blackColor forState:(UIControlStateNormal)];
    }
    return _msgBtn;
}


@end
