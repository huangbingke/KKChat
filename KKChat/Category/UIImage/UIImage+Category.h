//
//  UIImage+Category.h
//  KKChat
//
//  Created by q.zhang on 2021/1/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Category)


+ (UIImage *)svgImageName:(NSString *)name;


+ (UIImage *)svgImageName:(NSString *)name
               targetSize:(CGSize)size;


+ (UIImage *)svgImageName:(NSString *)name
               targetSize:(CGSize)size
                tintColor:(UIColor *)tintColor;


@end

NS_ASSUME_NONNULL_END
