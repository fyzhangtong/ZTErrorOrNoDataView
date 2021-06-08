//
//  UIView+AusonErrorOrNoDataView.m
//  auson
//
//  Created by zhangtong on 2021/6/8.
//

#import "UIView+AusonErrorOrNoDataView.h"
#import <ZTErrorOrNoDataView/UIView+ErrorOrNoDataView.h>

@implementation UIView (AusonErrorOrNoDataView)

- (void)showNetworkErrorWithActionBlock:(void(^)(void))actionBlock
{
    ZTButtonConfig *config = [ZTButtonConfig configWithTitle:@"刷新一下" titleColor:[UIColor whiteColor] titleFont:[UIFont fontWithName:@"PingFangSC-Regular" size:13] backColor:[UIColor blueColor] cornerRadius:4 size:CGSizeMake(90, 28) action:actionBlock];
    [self showErrorOrNoDataViewWithImage:@"network_error" backgroundColor:self.backgroundColor buttonConfig:config];
}
- (void)showNodataView
{
    [self showErrorOrNoDataViewWithImage:@"nodata" backgroundColor:self.backgroundColor buttonConfig:nil];
}


@end
