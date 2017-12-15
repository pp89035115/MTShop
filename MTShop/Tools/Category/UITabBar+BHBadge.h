//
//  UITabBar+BHBadge.h
//  BaiHaiShop
//
//  Created by Bai_Hai_LionYang on 2016/10/23.
//  Copyright © 2016年 LionYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Extension.h"
@interface UITabBar (BHBadge)

- (void)showBadgeOnItemIndex:(int)index;

- (void)hideBadgeOnItemIndex:(int)index;   

- (void)setBadgeValue:(NSInteger)value AtIndex:(NSInteger)index;

- (void)hideBadgeValueAtIndex:(NSInteger)index;

@end
