//
//  NSString+Add.m
//  KKTableViewDemo
//
//  Created by KK on 07/12/2020.
//

#import "NSString+Category.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (Add)




+ (CGSize)boundingALLRectWithText:(NSString*)text
                             Font:(UIFont*)font
                             Size:(CGSize)size {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc]init];
    [style setLineSpacing:2.0f];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, [text length])];
    
    CGSize realSize = CGSizeZero;

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
    CGRect textRect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font,NSParagraphStyleAttributeName:style} context:nil];
    realSize = textRect.size;
#else
    realSize = [txt sizeWithFont:font constrainedToSize:size];
#endif
    
    realSize.width = ceilf(realSize.width);
    realSize.height = ceilf(realSize.height);
    return realSize;
}



- (NSString *)md5 {
    // 获取c字符串
    const char *cStr = [self UTF8String];
    // 创建字符数组来接收MD5的值
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    // 计算MD5的值
    // 第一个参数: C字符串
    // 第二个参数: 字符串的长度
    // 第三个参数: 数组的首地址, 用来接收加密后的值
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    
    // 获取摘要值
    NSMutableString *resultStr = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [resultStr appendFormat:@"%02X", result[i]];
    }
    return resultStr;
}



@end
