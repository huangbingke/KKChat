//
//  UIButton+Category.h
//  KKChat
//
//  Created by KK on 2021/1/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, UIButtonLayoutType) {
    UIButtonLayoutTypeImageTop,
    UIButtonLayoutTypeImageLeft,
    UIButtonLayoutTypeImageBottom,
    UIButtonLayoutTypeImageRight,
};
@interface UIButton (Category)

- (void)setImageLayout:(UIButtonLayoutType)type space:(CGFloat)space;

/**
 titleLabel是否自适应宽度
 */
@property (nonatomic, assign) BOOL isSizeToFit;

@end

NS_ASSUME_NONNULL_END
