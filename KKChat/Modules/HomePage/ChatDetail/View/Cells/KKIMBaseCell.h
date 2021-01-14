//
//  KKIMBaseCell.h
//  KKChat
//
//  Created by q.zhang on 2021/1/13.
//

#import "KKBaseCell.h"
#import "KKIMBaseModel.h"

extern NSString * _Nonnull const KKIMCellMsgLongPressGestureNotificationName;

NS_ASSUME_NONNULL_BEGIN

@interface KKIMBaseCell : KKBaseCell

@property (nonatomic, strong) UIButton *selectBtn;
@property (nonatomic, strong) UIImageView *loadingImageView;

@end

NS_ASSUME_NONNULL_END
