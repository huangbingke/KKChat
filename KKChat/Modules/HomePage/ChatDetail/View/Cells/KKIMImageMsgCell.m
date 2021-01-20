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
        
        imageWidth = (150-kTopBottomMargin*2)*(width/height);
    } else {
        imageWidth = (kScreenWidth-60)/2;
    }
    [self.picImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-kMsgLeftRightMargin);
        make.top.mas_equalTo(self.contentView.mas_top).offset(kTopBottomMargin);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-kTopBottomMargin);
        make.width.mas_equalTo(imageWidth);
    }];
}
- (void)layoutUIForOther:(KKIMImageMsgCellModel *)baseModel {
    [super layoutUIForOther:baseModel];
    CGFloat height = baseModel.imageSize.height;
    CGFloat width = baseModel.imageSize.width;
    CGFloat imageWidth = 0;
    if (height >= width) {
        imageWidth = (150-kTopBottomMargin*2)*(width/height);
    } else {
        imageWidth = (kScreenWidth-60)/2;
    }
    [self.picImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(kMsgLeftRightMargin);
        make.top.mas_equalTo(self.contentView.mas_top).offset(kTopBottomMargin);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-kTopBottomMargin);
        make.width.mas_equalTo(imageWidth);
    }];
}

#pragma mark - Getter -
- (void)bigImageMode:(UITapGestureRecognizer *)sender {
    NSLog(@"点击图片啦");
    
}

#pragma mark - Getter -
- (UIImageView *)picImageView {
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_picImageView];
        _picImageView.contentMode = UIViewContentModeScaleAspectFit;
        _picImageView.layer.cornerRadius = kCornerRadius;
        _picImageView.layer.masksToBounds = YES;
        _picImageView.userInteractionEnabled = YES;
        [_picImageView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bigImageMode:)]];
    }
    return _picImageView;
}


@end
