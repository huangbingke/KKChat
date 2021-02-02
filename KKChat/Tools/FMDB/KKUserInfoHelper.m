//
//  KKUserInfoHelper.m
//  KKChat
//
//  Created by q.zhang on 2021/2/1.
//

#import "KKUserInfoHelper.h"

NSString * const KKUserInfoKey = @"KKUserInfoKey";
@implementation KKUserInfoHelper


- (BOOL)createUserInfoTable {
    FMResultSet *set = [self.db executeQuery:[NSString stringWithFormat:@"select *from '%@' where type = 'table' and name == '%@'", KKDBName, KKUserInfoKey]];
    if (![set next]) {
        NSString *execute = [NSString stringWithFormat:@"create table %@(user)", KKUserInfoKey];
        return [self.db executeUpdate:execute];
    }
    return NO;
}


- (BOOL)saveUserInfo:(KKUserInfoModel *)model {
    NSString *jsonModel = [model mj_JSONString];
    NSString *addExecute = [NSString stringWithFormat:@"insert into '%@' (user) values ('%@')", KKUserInfoKey, jsonModel];
    return [self.db executeUpdate:addExecute];
}

- (BOOL)deleteUserInfo:(KKUserInfoModel *)model {
    
}







@end
