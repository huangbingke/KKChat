//
//  KKBaseCellModel.h
//  KKChat
//
//  Created by KK on 23/12/2020.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface KKBaseCellModel : NSObject

@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, assign) CGFloat cellHeight;

- (instancetype)initWithCellHeight:(CGFloat)cellHeight
                    cellIdentifier:(NSString *)cellIdentifier;


@end

NS_ASSUME_NONNULL_END
