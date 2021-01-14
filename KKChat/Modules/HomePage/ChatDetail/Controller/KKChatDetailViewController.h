//
//  KKChatDetailViewController.h
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
@class KKHomeChatCellModel;
@interface KKChatDetailViewController : KKBaseViewController

@property (nonatomic, strong) KKHomeChatCellModel *chatModel;

@end

NS_ASSUME_NONNULL_END
