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
#import "KKIMSmallAppMsgCell.h"
#import "KKIMCallMsgCell.h"
#import "KKIMInvitationMsgCell.h"
#import "KKIMChatRecordMsgCell.h"
#import "KKIMReEditMsgCell.h"
NS_ASSUME_NONNULL_BEGIN

extern NSString * const KKIMTextMsgCellID;
extern NSString * const KKIMVoiceMsgCellID;
extern NSString * const KKIMImageMsgCellID;
extern NSString * const KKIMRedBagMsgCellID;
extern NSString * const KKIMTimeMsgCellID;
extern NSString * const KKIMSmallAppMsgCellID;
extern NSString * const KKIMCallMsgCellID;
extern NSString * const KKIMInvitationMsgCellID;
extern NSString * const KKIMChatRecordMsgCellID;
extern NSString * const KKIMReEditMsgCellID;

@interface KKChatTableView : UITableView

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath
                                 dataArray:(NSArray<KKIMBaseModel *>*)dataArray;

@end

NS_ASSUME_NONNULL_END
