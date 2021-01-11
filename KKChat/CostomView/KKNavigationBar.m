//
//  KKNavigationBar.m
//  KKChat
//
//  Created by q.zhang on 2021/1/7.
//

#import "KKNavigationBar.h"
#import <objc/runtime.h>
@interface KKNavigationBar ()

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, copy) ClickBlock leftAction;
@property (nonatomic, copy) ClickBlock rightAction;

@end
@implementation KKNavigationBar


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        CGSize size = CGSizeMake(kScreenWidth, kNavHeight);
        CGRect frame = self.frame;
        frame.size = size;
        self.frame = frame;

        CALayer *layer = [CALayer layer];
        layer.frame = CGRectMake(0, kNavHeight-0.5, kScreenWidth, 0.5);
        layer.backgroundColor = kColor(0xdddddd).CGColor;
        [self.layer addSublayer:layer];
        self.lineLayer = layer;
        self.backgroundColor = kBgColor;
    }
    return self;
}


- (instancetype)initWithTitle:(NSString *)title
                     leftName:(NSString *)leftName
                   leftAction:(ClickBlock)leftAction
                    rightName:(NSString *)rightName
                  rightAction:(ClickBlock)rightAction {
    if (self = [super init]) {
        self.bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kNavHeight)];
        self.bgImageView.userInteractionEnabled = YES;
        [self addSubview:self.bgImageView];
        
        UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, kNavHeight-44, kScreenWidth, 44-0.5)];
        [self addSubview:bottomView];
        if (title) {
            //WithFrame:CGRectMake(50, 0, kScreenWidth-100, 44)
            self.titleLabel = [[UILabel alloc] init];
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.titleLabel.text = title;
            [self.titleLabel sizeToFit];
            self.titleLabel.center = CGPointMake(bottomView.center.x, 22);
            [bottomView addSubview:self.titleLabel];
        }
        if (leftName) {
            self.leftBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
            self.leftBtn.frame = CGRectMake(0, 0, 44, 44);
            UIImage *image = [UIImage svgImageName:leftName];
            if (image) {
                [self.leftBtn setImage:image forState:(UIControlStateNormal)];
            } else {
                [self.leftBtn setTitle:leftName forState:(UIControlStateNormal)];
            }
            self.leftAction = leftAction;
            [self.leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:(UIControlEventTouchUpInside)];
            [bottomView addSubview:self.leftBtn];
        }
        if (rightName) {
            self.rightBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
            self.rightBtn.frame = CGRectMake(kScreenWidth-10-44, 0, 44, 44);
            [self.rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:(UIControlEventTouchUpInside)];
            UIImage *image = [UIImage svgImageName:rightName];
            if (image) {
                [self.rightBtn setImage:image forState:(UIControlStateNormal)];
            } else {
                [self.rightBtn setTitle:rightName forState:(UIControlStateNormal)];
            }
            self.rightAction = rightAction;
            [bottomView addSubview:self.rightBtn];
        }
    }
    return self;
}


+ (instancetype)setupNavigationBarWithTitle:(NSString *)title {
    return [[self alloc] initWithTitle:title leftName:nil leftAction:nil rightName:nil rightAction:nil];
}

+ (instancetype)setupNavigationBarWithTitle:(NSString *)title backAction:(ClickBlock)backAction {
    return [[self alloc] initWithTitle:title leftName:@"icons_filled_back.svg" leftAction:backAction rightName:nil rightAction:nil];
}

+ (instancetype)setupNavigationBarWithTitle:(NSString *)title
                                  rightName:(NSString *)rightName
                                rightAction:(ClickBlock)rightAction {
    return [[self alloc] initWithTitle:title leftName:nil leftAction:nil rightName:rightName rightAction:rightAction];
}

+ (instancetype)setupNavigationBarWithTitle:(NSString *)title
                                   leftName:(NSString *)leftName
                                 leftAction:(ClickBlock)leftAction {
    return [[self alloc] initWithTitle:title leftName:leftName leftAction:leftAction rightName:nil rightAction:nil];
}

+ (instancetype)setupNavigationBarWithTitle:(NSString *)title
                                   leftName:(NSString *)leftName
                                 leftAction:(ClickBlock)leftAction
                                  rightName:(NSString *)rightName
                                rightAction:(ClickBlock)rightAction {
    return [[self alloc] initWithTitle:title leftName:leftName leftAction:leftAction rightName:rightName rightAction:rightAction];
}


#pragma mark - Action -
- (void)leftBtnAction {
    if (self.leftAction) {
        self.leftAction();
    }
}
- (void)rightBtnAction {
    if (self.rightAction) {
        self.rightAction();
    }
}
#pragma mark - Setter -
- (void)setBgImage:(UIImage *)bgImage {
    _bgImage = bgImage;
    self.bgImageView.image = bgImage;
}
- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

#pragma mark - Getter -



@end


static const char kkNavigationBarKey = '\0';
@implementation UIViewController (KKNavigationBar)
- (void)setKkNavigationBar:(KKNavigationBar *)kkNavigationBar {
    if (self.kkNavigationBar != kkNavigationBar) {
        [self.kkNavigationBar removeFromSuperview];
        [self.view addSubview:kkNavigationBar];
        objc_setAssociatedObject(self, &kkNavigationBarKey, kkNavigationBar, OBJC_ASSOCIATION_ASSIGN);
    }
}
- (KKNavigationBar *)kkNavigationBar {
    return objc_getAssociatedObject(self, &kkNavigationBarKey);
}
@end
