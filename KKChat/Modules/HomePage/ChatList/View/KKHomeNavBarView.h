//
//  KKHomeNavBarView.h
//  KKChat
//
//  Created by q.zhang on 2021/1/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol KKHomeNavBarViewDelegate <NSObject>

- (void)navBarViewDidSelectMoreBtnAction;


@end
@interface KKHomeNavBarView : UIView

@property (nonatomic, weak) id<KKHomeNavBarViewDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
