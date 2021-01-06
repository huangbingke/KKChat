//
//  NSString+Add.h
//  KKTableViewDemo
//
//  Created by KK on 07/12/2020.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Category)


//计算文字高度
- (CGSize)boundingALLRectWithText:(NSString*)text
                             Font:(UIFont*)font
                             Size:(CGSize)size;










@end

NS_ASSUME_NONNULL_END
