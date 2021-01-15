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

@property (nonatomic, strong) UIButton *selectBtn; //多选消息
@property (nonatomic, strong) UIButton *loadingBtn;//加载图片, 发送失败显示红色叹号"❕"
@property (nonatomic, strong) UIButton *headBtn;//头像
 
//自己发送的消息, 和收到别人的消息, 同一种类型的消息用的同一种cell, 区分自己和别人, 左右相反的布局
- (void)layoutUIForMe:(KKIMBaseModel *)baseModel;
- (void)layoutUIForOther:(KKIMBaseModel *)baseModel;

@end

NS_ASSUME_NONNULL_END
