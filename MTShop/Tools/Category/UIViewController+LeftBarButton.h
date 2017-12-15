//
//  UIViewController+LeftBarButton.h
//  YK
//
//  Created by Lion on 16/1/5.
//  Copyright © 2016年 zzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BackButtonHandlerProtocol <NSObject>
@optional

-(BOOL)navigationShouldPopOnBackButton;

@end

@interface UIViewController (LeftBarButton)<BackButtonHandlerProtocol>

- (void)baseLeftAsBack;

- (void)setTitleWithStr:(NSString *)str Color:(UIColor *)color;

- (void)setNavigationBarColor:(UIColor *)color;

- (void)setnavigationbarLeftRightButtonWithLeftButton:(UINavigationItem *)leftButton RightButton:(UINavigationItem *)rightButton;

@end
