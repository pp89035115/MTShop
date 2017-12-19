//
//  UIView+Extension.h
//  
//
//  Created by apple on 14-6-27.
//  Copyright (c) 2014年 LionYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic) CGPoint origin;

- (void) setCorner:(float) r;
+ (UIView *)createLineView:(UIView *)superView;
+ (UIView *)createLineView:(UIView *)superView frame:(CGRect)rect;
+ (UIView *)createLineViewInTop:(UIView *)superView;
+ (UIView *)createLineViewInbottom:(UIView *)superView;
+ (void)createTapGestureInView:(UIView *)view target:(id)target action:(SEL)selector;
+ (CGRect)getRectWithX:(CGFloat)x Y:(CGFloat)y width:(CGFloat)width andHeight:(CGFloat)height;
- (UIView*)subViewOfClassName:(NSString*)className;
@end
