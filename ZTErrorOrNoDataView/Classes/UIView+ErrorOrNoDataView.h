//
//  UIView+ErrorOrNoDataView.h
//  FanBookClub
//
//  Created by zhangtong on 2019/12/24.
//  Copyright © 2019 Mac. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ErrorOrNoDataView)

- (void)showNetWorkErrorOrNoDataViewAtPointY:(CGFloat)pointY backImage:(NSString *__nullable)backImage actionButtonTitle:(NSString *__nullable)actionButtonTitle
                            actionTitleColor:(UIColor *)actionTitleColor
                            actionTitleFont:(UIFont *)actionTitleFont
                             actionBackColor:(UIColor *)actionBackColor
                          actionCornerRadius:(CGFloat)actionCornerRadius actionBlock:(void(^)(void))actionBlock;

- (void)dismissNetworkErrorOrNoDataView;
@end

NS_ASSUME_NONNULL_END
