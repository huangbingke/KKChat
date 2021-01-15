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

#define kTabBarHeight       (iPhoneXStyle ? 83 : 49)

#define kIPhoneXBottomHeight (iPhoneXStyle ? 34 : 0)

#define kColorRGB(r,g,b)    [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]

#define kColor(rgbValue)    [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define kRandomColor        [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

#define kThemeColor         kColor(0x57BE6A)

#define kBgColor            kColor(0xEFEFF4)

#define kQiPaoColor         kColor(0x7fe967)

#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
        #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
        #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
        #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
        #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif






#endif /* DefaultHeader_h */
