//
//  KKDBHelper.h
//  KKChat
//
//  Created by q.zhang on 2021/1/11.
//

#import <Foundation/Foundation.h>
#import <FMDB.h>
NS_ASSUME_NONNULL_BEGIN

extern NSString * const KKDBName;

@interface KKDBHelper : NSObject


+ (instancetype)shareHelper;

@property (nonatomic, strong) FMDatabase *db;

- (void)closeDataBase;







@end

NS_ASSUME_NONNULL_END
