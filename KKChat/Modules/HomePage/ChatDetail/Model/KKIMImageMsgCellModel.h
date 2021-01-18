//
//  KKIMImageMsgCellModel.h
//  KKChat
//
//  Created by q.zhang on 2021/1/15.
//

#import "KKIMBaseModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface KKIMImageMsgCellModel : KKIMBaseModel

@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, strong) UIImage *locationImage;

@property (nonatomic, assign) CGSize imageSize;

- (instancetype)initWithIsMe:(BOOL)isMe image:(id)image;

@end

NS_ASSUME_NONNULL_END
