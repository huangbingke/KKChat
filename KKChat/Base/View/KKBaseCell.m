//
//  KKBaseCell.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKBaseCell.h"

@implementation KKBaseCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        [self layoutUI];
    }
    return self;
}

- (void)setupUI {
    
}
- (void)layoutUI {
    
}
- (void)loadModel:(KKBaseCellModel *)baseModel {
    
}

@end
