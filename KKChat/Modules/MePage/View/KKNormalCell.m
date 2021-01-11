//
//  KKNormalCell.m
//  KKChat
//
//  Created by q.zhang on 2021/1/11.
//

#import "KKNormalCell.h"

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
    layer.frame = CGRectMake(60, 44.5, kScreenWidth-60, 0.5);
    layer.backgroundColor = kBgColor.CGColor;
    [self.contentView.layer addSublayer:layer];
    
    
    
    
    
}






@end
