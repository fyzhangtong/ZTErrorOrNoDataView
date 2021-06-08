//
//  ZTButtonConfig.m
//  ErrorOrNoDataView
//
//  Created by zhangtong on 2021/6/8.
//

#import "ZTButtonConfig.h"

@implementation ZTButtonConfig

+ (instancetype)configWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont backColor:(UIColor *)backColor cornerRadius:(CGFloat)cornerRadius size:(CGSize)size action:(void(^)(void))action
{
    ZTButtonConfig *config = [ZTButtonConfig new];
    config.title = title;
    config.titleColor = titleColor;
    config.titleFont = titleFont;
    config.backColor = backColor;
    config.cornerRadius = cornerRadius;
    config.size = size;
    config.action = action;
    return config;
}

@end
