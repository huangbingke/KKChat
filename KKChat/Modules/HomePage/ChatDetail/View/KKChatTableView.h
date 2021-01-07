//
//  KKChatTableView.h
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import <UIKit/UIKit.h>
#import "KKIMTextMsgCell.h"
#import "KKIMVoiceMsgCell.h"
#import "KKIMImageMsgCell.h"
#import "KKIMRedBagMsgCell.h"
#import "KKIMTimeMsgCell.h"
#import "KKIMSmallAppCell.h"
#import "KKIMCallMsgCell.h"

NS_ASSUME_NONNULL_BEGIN

extern NSString * const KKIMTextMsgCellID;
extern NSString * const KKIMVoiceMsgCellID;
extern NSString * const KKIMImageMsgCellID;
extern NSString * const KKIMRedBagMsgCellID;
extern NSString * const KKIMTimeMsgCellID;
extern NSString * const KKIMSmallAppCellID;
extern NSString * const KKIMCallMsgCellID;


@interface KKChatTableView : UITableView

@end

NS_ASSUME_NONNULL_END
