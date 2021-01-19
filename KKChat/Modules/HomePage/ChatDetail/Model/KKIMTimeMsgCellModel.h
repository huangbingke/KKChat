//
//  KKIMTimeMsgCellModel.h
//  KKChat
//
//  Created by q.zhang on 2021/1/15.
//

#import "KKIMBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KKIMTimeMsgCellModel : KKIMBaseModel

@property (nonatomic, copy) NSString *showDate;//展示的时间
- (instancetype)initWithShowDate:(NSString *)showDate;
@end

NS_ASSUME_NONNULL_END
