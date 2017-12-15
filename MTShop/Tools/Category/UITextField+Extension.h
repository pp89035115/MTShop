//
//  UITextField+Extension.h
//  Bangzhu_2.0
//
//  Created by BangZhuNetWork on 15/5/5.
//  Copyright (c) 2015年 LionYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extension)



CGPoint CGRectGetCenter2(CGRect rect);
CGRect  CGRectMoveToCenter2(CGRect rect, CGPoint center);

@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;

@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;
@end
