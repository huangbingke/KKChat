//
//  KKUserInfoManager.m
//  KKChat
//
//  Created by q.zhang on 2021/2/1.
//

#import "KKUserInfoManager.h"
#import "NSString+Category.h"

static KKUserInfoModel * userInfoModel = nil;
@implementation KKUserInfoManager

+ (void)saveUserInfoModel:(KKUserInfoModel *)model {
    [KKUserInfoManager cleanUserInfoModel:model];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:model];
    [userDefaults setObject:data forKey:[model.userId md5]];
    [userDefaults synchronize];
}

+ (void)cleanUserInfoModel:(KKUserInfoModel *)model {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:[model.userId md5]];
    [userDefaults synchronize];
    userInfoModel = nil;
}


+ (KKUserInfoModel *)getUserInfo {
    if (!userInfoModel) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        
    }
    return userInfoModel;
}
















@end
