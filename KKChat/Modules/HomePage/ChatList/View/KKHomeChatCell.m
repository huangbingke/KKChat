//
//  KKHomeChatCell.m
//  KKChat
//
//  Created by KK on 2020/12/24.
//

#import "KKHomeChatCell.h"
NSString * const KKHomeChatCellID = @"KKHomeChatCellID";


@interface KKHomeChatCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *headImageView;
@property (nonatomic, strong) UILabel *messageLabel;
@property (nonatomic, strong) UILabel *messageCountLabel;


@end
@implementation KKHomeChatCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
