//
//  UITabBar+BHBadge.m
//  BaiHaiShop
//
//  Created by Bai_Hai_LionYang on 2016/10/23.
//  Copyright © 2016年 LionYang. All rights reserved.
//

#import "UITabBar+BHBadge.h"

#define TabbarItemNums 4   //tabbarItem count

@implementation UITabBar (BHBadge)

- (void)showBadgeOnItemIndex:(int)index{

    [self removeBadgeOnItemIndex:index];

    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 888 + index;
    badgeView.layer.cornerRadius = 5;
    badgeView.backgroundColor = [UIColor redColor];
    CGRect tabFrame = self.frame;

    float percentX = (index + 0.6) / TabbarItemNums;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 10, 10);
    [self addSubview:badgeView];
}

- (void)hideBadgeOnItemIndex:(int)index{

    [self removeBadgeOnItemIndex:index];
}

- (void)removeBadgeOnItemIndex:(int)index{

    for (UIView *subView in self.subviews) {
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
}

- (void)setBadgeValue:(NSInteger)value AtIndex:(NSInteger)index {
    if (index<0||index>=TabbarItemNums) {
        return;
    }
    [self hideBadgeValueAtIndex:index];
    CGRect tabFrame = self.frame;
    float percentX = (index + 0.55) / TabbarItemNums;
    CGFloat x = ceilf(percentX * tabFrame.size.width);
    CGFloat y = ceilf(0.1 * tabFrame.size.height);
    
    UILabel *badgeLabel = [UILabel new];
    badgeLabel.frame = CGRectMake(x, y, 15, 15);
    badgeLabel.backgroundColor = [UIColor redColor];
    badgeLabel.tag = 999+index;
    badgeLabel.textColor = [UIColor whiteColor];
    badgeLabel.font = [UIFont systemFontOfSize:9];
    badgeLabel.textAlignment = NSTextAlignmentCenter;
    badgeLabel.layer.cornerRadius = badgeLabel.height/2.0;
    badgeLabel.layer.masksToBounds = YES;
    [self addSubview:badgeLabel];
    
    value = value>99 ? 99 : value;
    badgeLabel.text = [NSString stringWithFormat:@"%zd",value];
    if (value <= 0) {
        badgeLabel.hidden = YES;
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
        scaleAnimation.toValue = [NSNumber numberWithFloat:0.7];
        scaleAnimation.duration = 0.1;
        scaleAnimation.repeatCount = 2;
        scaleAnimation.autoreverses = YES;
        scaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        [badgeLabel.layer addAnimation:scaleAnimation forKey:nil];
    });

}

- (void)hideBadgeValueAtIndex:(NSInteger)index {
    for (UIView *subView in self.subviews) {
        if (subView.tag == 999+index) {
            [subView removeFromSuperview];
        }
    }
}


@end
