//
//  KKUserInfoManager.h
//  KKChat
//
//  Created by q.zhang on 2021/2/1.
//

#import <Foundation/Foundation.h>
#import "KKUserInfoModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface KKUserInfoManager : NSObject

@property (nonatomic, strong) KKUserInfoModel *userModel;

+ (void)saveUserInfoModel:(KKUserInfoModel *)model;








@end

NS_ASSUME_NONNULL_END
