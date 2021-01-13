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
@implementation KKChatTableView


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {

        [self registerClass:[KKIMTextMsgCell class] forCellReuseIdentifier:KKIMTextMsgCellID];
        [self registerClass:[KKIMVoiceMsgCell class] forCellReuseIdentifier:KKIMVoiceMsgCellID];
        [self registerClass:[KKIMImageMsgCell class] forCellReuseIdentifier:KKIMImageMsgCellID];
        [self registerClass:[KKIMRedBagMsgCell class] forCellReuseIdentifier:KKIMRedBagMsgCellID];
        [self registerClass:[KKIMTimeMsgCell class] forCellReuseIdentifier:KKIMTimeMsgCellID];
        [self registerClass:[KKIMSmallAppMsgCell class] forCellReuseIdentifier:KKIMSmallAppMsgCellID];
        [self registerClass:[KKIMCallMsgCell class] forCellReuseIdentifier:KKIMCallMsgCellID];
        [self registerClass:[KKIMInvitationMsgCell class] forCellReuseIdentifier:KKIMInvitationMsgCellID];
        
        
        if (@available(iOS 11.0, *)) {
            self.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return self;
}












@end
