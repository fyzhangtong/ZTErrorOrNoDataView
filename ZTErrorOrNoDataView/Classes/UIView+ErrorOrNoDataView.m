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
- (void)showErrorOrNoDataViewWithImage:(NSString *)backImage backgroundColor:(UIColor *)backgroundColor buttonConfig:(ZTButtonConfig *)buttonConfig
{
    if (self.networkErrorOrNoDataView) {
        [self dismissNetworkErrorOrNoDataView];
    }
    UIView *networkErrorOrNoDataView = [[UIView alloc] init];
    networkErrorOrNoDataView.backgroundColor = backgroundColor;
    networkErrorOrNoDataView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    
    [self addSubview:networkErrorOrNoDataView];
    UIImageView *backImageView = [UIImageView new];
    backImageView.image = [UIImage imageNamed:backImage];
    [networkErrorOrNoDataView addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(networkErrorOrNoDataView.mas_centerX);
        make.centerY.mas_equalTo(0).mas_offset(-80);
    }];
    if (buttonConfig) {
        self.networkErrorOrNoDataViewButtonActionBlock = buttonConfig.action;
        UIButton *actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        actionButton.layer.masksToBounds = YES;
        actionButton.layer.cornerRadius = buttonConfig.cornerRadius;
        actionButton.titleLabel.font = buttonConfig.titleFont;
        [actionButton setTitleColor:buttonConfig.titleColor forState:UIControlStateNormal];
        [actionButton setBackgroundColor:buttonConfig.backColor];
        [actionButton setTitle:buttonConfig.title forState:UIControlStateNormal];
        [actionButton addTarget:self action:@selector(networkErrorOrNoDataViewButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [networkErrorOrNoDataView addSubview:actionButton];
        [actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(backImageView.mas_centerX);
            make.top.mas_equalTo(backImageView.mas_bottom).mas_offset(20);
            make.size.mas_equalTo(buttonConfig.size);
        }];
    }
    self.networkErrorOrNoDataView = networkErrorOrNoDataView;
    self.networkErrorOrNoDataViewButtonActionBlock = buttonConfig.action;
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
