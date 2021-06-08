//
//  UIView+AusonErrorOrNoDataView.h
//  auson
//
//  Created by zhangtong on 2021/6/8.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (AusonErrorOrNoDataView)

- (void)showNetworkErrorWithActionBlock:(void(^)(void))actionBlock;
- (void)showNodataView;

@end

NS_ASSUME_NONNULL_END
