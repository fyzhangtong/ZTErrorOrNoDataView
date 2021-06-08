//
//  UIView+ErrorOrNoDataView.h
//  FanBookClub
//
//  Created by zhangtong on 2019/12/24.
//  Copyright © 2019 Mac. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ZTButtonConfig.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ErrorOrNoDataView)

- (void)showErrorOrNoDataViewWithImage:(NSString *)backImage backgroundColor:(UIColor *)backgroundColor buttonConfig:(ZTButtonConfig *)buttonConfig;

- (void)dismissNetworkErrorOrNoDataView;
@end

NS_ASSUME_NONNULL_END
