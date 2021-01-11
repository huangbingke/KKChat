//
//  KKNavigationBar.h
//  KKChat
//
//  Created by q.zhang on 2021/1/7.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^ClickBlock)(void);
@interface KKNavigationBar : UIView


@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIImage *bgImage;
@property (nonatomic, copy) NSString *title;

+ (instancetype)setupNavigationBarWithTitle:(NSString *)title;

+ (instancetype)setupNavigationBarWithTitle:(NSString *)title
                                 backAction:(ClickBlock)backAction;

+ (instancetype)setupNavigationBarWithTitle:(NSString *)title
                                  rightName:(NSString *)rightName
                                rightAction:(ClickBlock)rightAction;

+ (instancetype)setupNavigationBarWithTitle:(NSString *)title
                                   leftName:(NSString *)leftName
                                 leftAction:(ClickBlock)leftAction;

+ (instancetype)setupNavigationBarWithTitle:(NSString *)title
                                   leftName:(NSString *)leftName
                                 leftAction:(ClickBlock)leftAction
                                  rightName:(NSString *)rightName
                                rightAction:(ClickBlock)rightAction;


@end

@interface UIViewController (KKNavigationBar)

@property (nonatomic, strong) KKNavigationBar *kkNavigationBar;

@end


NS_ASSUME_NONNULL_END
