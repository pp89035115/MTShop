//
//  UILabel+Extension.h
//  myhome
//
//  Created by Mac_lion on 15/6/3.
//  Copyright (c) 2015年 LionYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

CGPoint CGRectGetCenter3(CGRect rect);
CGRect  CGRectMoveToCenter3(CGRect rect, CGPoint center);

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
