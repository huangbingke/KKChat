//
//  KKChatTableView.m
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import "KKChatTableView.h"
NSString * const KKIMTextMsgCellID = @"KKIMTextMsgCellID";
NSString * const KKIMVoiceMsgCellID = @"KKIMVoiceMsgCellID";
NSString * const KKIMImageMsgCellID = @"KKIMImageMsgCellID";
NSString * const KKIMRedBagMsgCellID = @"KKIMRedBagMsgCellID";
NSString * const KKIMTimeMsgCellID = @"KKIMTimeMsgCellID";
NSString * const KKIMSmallAppMsgCellID = @"KKIMSmallAppMsgCellID";
NSString * const KKIMCallMsgCellID = @"KKIMCallMsgCellID";
NSString * const KKIMInvitationMsgCellID = @"KKIMInvitationMsgCellID";
NSString * const KKIMChatRecordMsgCellID = @"KKIMChatRecordMsgCellID";
NSString * const KKIMReEditMsgCellID = @"KKIMReEditMsgCellID";
NSString * const KKIMVideoMsgCellID = @"KKIMVideoMsgCellID";
@interface KKChatTableView ()

@end

@implementation KKChatTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.separatorStyle = UITableViewCellSeparatorStyleNone;

        [self registerClass:[KKIMTextMsgCell class] forCellReuseIdentifier:KKIMTextMsgCellID];
        [self registerClass:[KKIMVoiceMsgCell class] forCellReuseIdentifier:KKIMVoiceMsgCellID];
        [self registerClass:[KKIMImageMsgCell class] forCellReuseIdentifier:KKIMImageMsgCellID];
        [self registerClass:[KKIMRedBagMsgCell class] forCellReuseIdentifier:KKIMRedBagMsgCellID];
        [self registerClass:[KKIMTimeMsgCell class] forCellReuseIdentifier:KKIMTimeMsgCellID];
        [self registerClass:[KKIMSmallAppMsgCell class] forCellReuseIdentifier:KKIMSmallAppMsgCellID];
        [self registerClass:[KKIMCallMsgCell class] forCellReuseIdentifier:KKIMCallMsgCellID];
        [self registerClass:[KKIMInvitationMsgCell class] forCellReuseIdentifier:KKIMInvitationMsgCellID];
        [self registerClass:[KKIMChatRecordMsgCell class] forCellReuseIdentifier:KKIMChatRecordMsgCellID];
        [self registerClass:[KKIMReEditMsgCell class] forCellReuseIdentifier:KKIMReEditMsgCellID];
        [self registerClass:[KKIMVideoMsgCell class] forCellReuseIdentifier:KKIMVideoMsgCellID];
        
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return self;
}

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath
                                 dataArray:(NSArray<KKIMBaseModel *>*)dataArray {
    KKIMBaseModel *baseModel = dataArray[indexPath.row];
    if ([baseModel isKindOfClass:KKIMTextMsgCellModel.class]) {
        KKIMTextMsgCell *cell = [self dequeueReusableCellWithIdentifier:KKIMTextMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    } else if ([baseModel isKindOfClass:KKIMVoiceMsgCellModel.class]) {
        KKIMVoiceMsgCell *cell = [self dequeueReusableCellWithIdentifier:KKIMVoiceMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    } else if ([baseModel isKindOfClass:KKIMImageMsgCellModel.class]) {
        KKIMImageMsgCell *cell = [self dequeueReusableCellWithIdentifier:KKIMImageMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    } else if ([baseModel isKindOfClass:KKIMRedBagMsgCellModel.class]) {
        KKIMRedBagMsgCell *cell = [self dequeueReusableCellWithIdentifier:KKIMRedBagMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    } else if ([baseModel isKindOfClass:KKIMTimeMsgCellModel.class]) {
        KKIMTimeMsgCell *cell = [self dequeueReusableCellWithIdentifier:KKIMTimeMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    } else if ([baseModel isKindOfClass:KKIMSmallAppMsgCellModel.class]) {
        KKIMSmallAppMsgCell *cell = [self dequeueReusableCellWithIdentifier:KKIMSmallAppMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    } else if ([baseModel isKindOfClass:KKIMCallMsgCellModel.class]) {
        KKIMCallMsgCell *cell = [self dequeueReusableCellWithIdentifier:KKIMCallMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    } else if ([baseModel isKindOfClass:KKIMInvitationMsgCellModel.class]) {
        KKIMInvitationMsgCell *cell = [self dequeueReusableCellWithIdentifier:KKIMInvitationMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    } else if ([baseModel isKindOfClass:KKIMChatRecordMsgCellModel.class]) {
        KKIMChatRecordMsgCell *cell = [self dequeueReusableCellWithIdentifier:KKIMChatRecordMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    } else if ([baseModel isKindOfClass:KKIMReEditMsgCellModel.class]) {
        KKIMReEditMsgCell *cell = [self dequeueReusableCellWithIdentifier:KKIMReEditMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    } else if ([baseModel isKindOfClass:KKIMVideoMsgCellModel.class]) {
        KKIMVideoMsgCell *cell = [self dequeueReusableCellWithIdentifier:KKIMVideoMsgCellID forIndexPath:indexPath];
        [cell loadModel:baseModel];
        return cell;
    }
    return UITableViewCell.new;
}






@end
