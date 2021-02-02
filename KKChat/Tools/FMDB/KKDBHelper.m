//
//  KKDBHelper.m
//  KKChat
//
//  Created by q.zhang on 2021/1/11.
//

#import "KKDBHelper.h"
NSString * const KKDBName = @"KKChat.sqlite";
@implementation KKDBHelper

+ (instancetype)shareHelper {
    static KKDBHelper *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        helper = [KKDBHelper new];
    });
    return helper;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self createDBWithName:KKDBName];
    }
    return self;
}

- (void)createDBWithName:(NSString *)name {
    NSString *docPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *dbPath = [docPath stringByAppendingString:name];
    self.db = [[FMDatabase alloc] initWithPath:dbPath];
    [self.db open];
}

- (void)closeDataBase {
    [self.db close];
}

- (void)dealloc {
    [self closeDataBase];
}

@end
