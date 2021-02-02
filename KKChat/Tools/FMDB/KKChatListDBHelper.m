//
//  KKChatListDBHelper.m
//  KKChat
//
//  Created by q.zhang on 2021/1/11.
//

#import "KKChatListDBHelper.h"

@implementation KKChatListDBHelper


- (void)createTableWithModel:(KKUserInfoModel *)model {
    FMResultSet *set = [self.db executeQuery:[NSString stringWithFormat:@"select *from %@ where type = 'table' and name == ChatList_'%@'", KKDBName, model.userId]];
    
    
}














@end
