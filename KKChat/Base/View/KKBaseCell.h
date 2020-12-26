//
//  KKBaseCell.h
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import <UIKit/UIKit.h>
#import "KKBaseCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KKBaseCell : UITableViewCell



- (void)setupUI;
- (void)layoutUI;
- (void)loadModel:(KKBaseCellModel *)baseModel;


@end

NS_ASSUME_NONNULL_END
