//
//  KKIMReEditMsgCell.m
//  KKChat
//
//  Created by q.zhang on 2021/1/14.
//

#import "KKIMReEditMsgCell.h"
#import <YYText.h>
@interface KKIMReEditMsgCell ()

@property (nonatomic, strong) YYLabel *tipLabel;

@end
@implementation KKIMReEditMsgCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setupUI {
    [super setupUI];
    
}
- (void)loadModel:(KKBaseCellModel *)baseModel {
    [super loadModel:baseModel];
}



@end
