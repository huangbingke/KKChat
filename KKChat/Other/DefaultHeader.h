//
//  DefaultHeader.h
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#ifndef DefaultHeader_h
#define DefaultHeader_h




#define kScreenWidth        [UIScreen mainScreen].bounds.size.width

#define kScreenHeight       [UIScreen mainScreen].bounds.size.height

///是否是iPhoneX+系列，刘海屏
#define iPhoneXStyle \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define kNavHeight          (iPhoneXStyle ? 88 : 64)

#define kStatusHeight       (iPhoneXStyle ? 44 : 20)

#define kColorRGB(r,g,b)    [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]

#define kColor(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kRandomColor        [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#define kThemeColor         kColor(0x57BE6A)

#define kBgColor            kColor(0xEFEFF4)


#endif /* DefaultHeader_h */
