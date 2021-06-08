//
//  ZTButtonConfig.h
//  ErrorOrNoDataView
//
//  Created by zhangtong on 2021/6/8.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZTButtonConfig : NSObject

@property (nonatomic, copy)       NSString *title;
@property (nonatomic, strong)     UIColor *titleColor;
@property (nonatomic, strong)     UIFont *titleFont;
@property (nonatomic, strong)     UIColor *backColor;
@property (nonatomic, assign)     CGFloat cornerRadius;
@property (nonatomic)             CGSize size;
@property (nonatomic, copy)       void(^action)(void);

+ (instancetype)configWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont backColor:(UIColor *)backColor cornerRadius:(CGFloat)cornerRadius size:(CGSize)size action:(void(^)(void))action;

@end

NS_ASSUME_NONNULL_END
