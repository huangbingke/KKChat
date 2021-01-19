//
//  KKChatExpressionView.h
//  KKChat
//
//  Created by KK on 2021/1/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
extern NSString * const KKChatExpressionCellID;
@interface KKChatExpressionView : UIView



@end

@class KKChatExpressionModel;
@interface KKChatExpressionCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *picImageView;
@property (nonatomic, strong) KKChatExpressionModel *expressionModel;

@end

@interface KKChatExpressionModel : NSObject

@property (nonatomic, copy) NSString *face_name;
@property (nonatomic, copy) NSString *face_id;

@end

NS_ASSUME_NONNULL_END
