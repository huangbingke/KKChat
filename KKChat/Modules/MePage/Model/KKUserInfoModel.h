//
//  KKUserInfoModel.h
//  KKChat
//
//  Created by q.zhang on 2021/1/11.
//

#import "KKBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KKUserInfoModel : KKBaseModel<NSCoding>

@property (nonatomic, copy) NSString *userId;

@end

NS_ASSUME_NONNULL_END
