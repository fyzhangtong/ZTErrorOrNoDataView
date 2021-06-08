//
//  UIView+ErrorOrNoDataView.m
//  FanBookClub
//
//  Created by zhangtong on 2019/12/24.
//  Copyright © 2019 Mac. All rights reserved.
//

#import "UIView+ErrorOrNoDataView.h"
#import "Masonry.h"

#import <objc/runtime.h>

@implementation UIView (ErrorOrNoDataView)

#pragma mark - setter
- (void)setNetworkErrorOrNoDataView:(UIView *)networkErrorOrNoDataView {
    objc_setAssociatedObject(self, @selector(networkErrorOrNoDataView), networkErrorOrNoDataView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)setNetworkErrorOrNoDataViewButtonActionBlock:(void(^)(void))networkErrorOrNoDataViewButtonActionBlock{
    objc_setAssociatedObject(self, @selector(networkErrorOrNoDataViewButtonActionBlock), networkErrorOrNoDataViewButtonActionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
#pragma mark - getter
- (UIView *)networkErrorOrNoDataView {
    return objc_getAssociatedObject(self, _cmd);
}
- (void(^)(void))networkErrorOrNoDataViewButtonActionBlock
{
    return objc_getAssociatedObject(self, _cmd);
}
- (void)showNetWorkErrorOrNoDataViewAtPointY:(CGFloat)pointY backImage:(NSString *__nullable)backImage actionButtonTitle:(NSString *__nullable)actionButtonTitle
                            actionTitleColor:(UIColor *)actionTitleColor
                             actionTitleFont:(UIFont *)actionTitleFont
                             actionBackColor:(UIColor *)actionBackColor
                          actionCornerRadius:(CGFloat)actionCornerRadius actionBlock:(void(^)(void))actionBlock
{
    if (self.networkErrorOrNoDataView) {
        [self dismissNetworkErrorOrNoDataView];
    }
    UIView *networkErrorOrNoDataView = [[UIView alloc] init];
    networkErrorOrNoDataView.backgroundColor = [UIColor whiteColor];
    CGRect rect = self.bounds;
    rect.origin.y = pointY;
    networkErrorOrNoDataView.frame = rect;
    
    [self addSubview:networkErrorOrNoDataView];
    UIImageView *backImageView = [UIImageView new];
    backImageView.image = [UIImage imageNamed:backImage];
    [networkErrorOrNoDataView addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(networkErrorOrNoDataView.mas_centerX);
        make.top.mas_equalTo(rect.size.height/4.0);
    }];
    if (actionButtonTitle && actionBlock) {
        self.networkErrorOrNoDataViewButtonActionBlock = actionBlock;
        UIButton *actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        actionButton.layer.masksToBounds = YES;
        actionButton.layer.cornerRadius = 18.5;
        actionButton.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
        [actionButton setTitleColor:actionTitleColor forState:UIControlStateNormal];
        [actionButton setBackgroundColor:actionBackColor];
        [actionButton setTitle:actionButtonTitle forState:UIControlStateNormal];
        [actionButton addTarget:self action:@selector(networkErrorOrNoDataViewButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [networkErrorOrNoDataView addSubview:actionButton];
        [actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(backImageView.mas_centerX);
            make.top.mas_equalTo(backImageView.mas_bottom).mas_offset(20);
            make.height.mas_equalTo(37);
            make.width.mas_greaterThanOrEqualTo(120);
        }];
    }
    self.networkErrorOrNoDataView = networkErrorOrNoDataView;
    self.networkErrorOrNoDataViewButtonActionBlock = actionBlock;
}
- (void)networkErrorOrNoDataViewButtonAction:(UIButton *)sender
{
    [self dismissNetworkErrorOrNoDataView];
    if (self.networkErrorOrNoDataViewButtonActionBlock) {
        self.networkErrorOrNoDataViewButtonActionBlock();
        self.networkErrorOrNoDataViewButtonActionBlock = NULL;
    }
}
- (void)dismissNetworkErrorOrNoDataView
{
    if (self.networkErrorOrNoDataView.superview) {
        [self.networkErrorOrNoDataView removeFromSuperview];
    }
}

@end
