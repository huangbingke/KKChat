//
//  KKNormalCell.h
//  KKChat
//
//  Created by q.zhang on 2021/1/11.
//

#import "KKBaseCell.h"
#import "KKNormalCellModel.h"

NS_ASSUME_NONNULL_BEGIN
extern NSString * const KKNormalCellID;
@interface KKNormalCell : KKBaseCell


@property (nonatomic, strong) KKNormalCellModel *cellModel;


@end

NS_ASSUME_NONNULL_END
