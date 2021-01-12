//
//  KKChatMoreView.h
//  KKChat
//
//  Created by q.zhang on 2021/1/8.
//

#import <UIKit/UIKit.h>
#import "KKHomeListCellModel.h"

NS_ASSUME_NONNULL_BEGIN
@class KKChatMoreViewCellModel;

@interface KKChatMoreView : UIView
- (instancetype)initWithMsgType:(KKMessageType)msgType;

@end


@interface KKChatMoreViewCellModel : NSObject
@property (nonatomic, copy) NSString *pic;
@property (nonatomic, copy) NSString *title;
- (instancetype)initWithTitle:(NSString *)title pic:(NSString *)pic;
@end

@interface KKChatMoreViewCell : UICollectionViewCell
@property (nonatomic, strong) KKChatMoreViewCellModel *cellModel;
@end
NS_ASSUME_NONNULL_END
