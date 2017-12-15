//
//  UIViewController+Extension.m
//  LHProject
//
//  Created by Bai_Hai_LionYang on 2016/12/7.
//  Copyright © 2016年 LionYang. All rights reserved.
//

#import "UIViewController+Extension.h"

@implementation UIViewController (Extension)

- (void)popToView
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)popToRootView
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)disMissView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
