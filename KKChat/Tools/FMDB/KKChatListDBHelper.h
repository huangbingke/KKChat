//
//  KKChatListDBHelper.h
//  KKChat
//
//  Created by q.zhang on 2021/1/11.
//

#import "KKDBHelper.h"
#import "KKHomeListCellModel.h"
#import "KKUserInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface KKChatListDBHelper : KKDBHelper

- (void)createTableWithModel:(KKUserInfoModel *)model;










@end

NS_ASSUME_NONNULL_END
