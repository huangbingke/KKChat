//
//  KKIMImageCell.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKIMImageMsgCell.h"

@interface KKIMImageMsgCell ()

@property (nonatomic, strong) UIImageView *picImageView;

@end

@implementation KKIMImageMsgCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)loadModel:(KKBaseCellModel *)baseModel {
    KKIMImageMsgCellModel *model = (KKIMImageMsgCellModel *)baseModel;
    if (model.isMe) {
        [self layoutUIForMe:model];
    } else {
        [self layoutUIForOther:model];
    }
    self.picImageView.image = model.locationImage;
}
- (void)layoutUIForMe:(KKIMImageMsgCellModel *)baseModel {
    [super layoutUIForMe:baseModel];
    CGFloat height = baseModel.imageSize.height;
    CGFloat width = baseModel.imageSize.width;
    CGFloat imageWidth = 0;
    if (height >= width) {
        
        imageWidth = (150-24)*(width/height);
    } else {
        imageWidth = (kScreenWidth-60)/2;
    }
    [self.picImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-61);
        make.top.mas_equalTo(self.contentView.mas_top).offset(12);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-12);
        make.width.mas_equalTo(imageWidth);
    }];
}
- (void)layoutUIForOther:(KKIMImageMsgCellModel *)baseModel {
    [super layoutUIForOther:baseModel];
    CGFloat height = baseModel.imageSize.height;
    CGFloat width = baseModel.imageSize.width;
    CGFloat imageWidth = 0;
    if (height >= width) {
        
        imageWidth = (150-24)*(width/height);
    } else {
        imageWidth = (kScreenWidth-60)/2;
    }
    [self.picImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(61);
        make.top.mas_equalTo(self.contentView.mas_top).offset(12);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-12);
        make.width.mas_equalTo(imageWidth);
    }];

}

#pragma mark - Getter -
- (UIImageView *)picImageView {
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_picImageView];
        _picImageView.contentMode = UIViewContentModeScaleAspectFit;
        _picImageView.layer.cornerRadius = 5;
        _picImageView.layer.masksToBounds = YES;
    }
    return _picImageView;
}


@end
