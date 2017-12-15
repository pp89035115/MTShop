//
//  UIViewController+LeftBarButton.m
//  YK
//
//  Created by Lion on 16/1/5.
//  Copyright © 2016年 zzh. All rights reserved.
//

#import "UIViewController+LeftBarButton.h"
#import "UIColor+Extension.h"
@implementation UIViewController (LeftBarButton)

- (void)baseLeftAsBack
{
    /**
     *  设置navagation返回键为白色 和防止三个小蓝点随机出现
     */
    [self.navigationItem.backBarButtonItem setTitle:@""];
    if (self.navigationController.viewControllers.count >= 1) {
        
        [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
        
        self.navigationController.navigationBar.topItem.title = @"";
        
        self.navigationController.navigationBar.backItem.title = @"";
    }
    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRGB:0x178eae alpha:1.]];
}
- (void)setNavigationBarColor:(UIColor *)color
{
    [self.navigationController.navigationBar setBarTintColor:color];
}

- (void)baseBackToUpper:(UIBarButtonItem *)bbi
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setTitleWithStr:(NSString *)str Color:(UIColor *)color
{
    self.title = str;
    NSDictionary * dict=[NSDictionary dictionaryWithObject:color forKey:NSForegroundColorAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
}

- (void)setnavigationbarLeftRightButtonWithLeftButton:(UIBarButtonItem *)leftButton RightButton:(UIBarButtonItem *)rightButton
{
    self.navigationItem.leftBarButtonItem = leftButton;
    self.navigationItem.rightBarButtonItem = rightButton;
}
@end

@implementation UINavigationController (ShouldPopOnBackButton)

- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item {
    
    if([self.viewControllers count] < [navigationBar.items count]) {
        return YES;
    }
    
    BOOL shouldPop = YES;
    UIViewController* vc = [self topViewController];
    if([vc respondsToSelector:@selector(navigationShouldPopOnBackButton)]) {
        shouldPop = [vc navigationShouldPopOnBackButton];
    }
    
    if(shouldPop) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self popViewControllerAnimated:YES];
        });
    } else {
        // Workaround for iOS7.1. Thanks to @boliva - http://stackoverflow.com/posts/comments/34452906
        for(UIView *subview in [navigationBar subviews]) {
            if(0. < subview.alpha && subview.alpha < 1.) {
                [UIView animateWithDuration:.25 animations:^{
                    subview.alpha = 1.;
                }];
            }
        }
    }
    
    return NO;
}
@end;
