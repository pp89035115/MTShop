//
//  UIView+Extension.m
//
//  Created by apple on 14-6-27.
//  Copyright (c) 2014年 LionYang. All rights reserved.
//

#import "UIView+Extension.h"
#define gScreenHeight   [UIScreen mainScreen].bounds.size.height
#define gScreenWidth    [UIScreen mainScreen].bounds.size.width
#define gScreenRect     [UIScreen mainScreen].bounds

#define IPHONE4S (([[UIScreen mainScreen] bounds].size.width == 320) && ([[UIScreen mainScreen] bounds].size.height == 480))
#define IPHONE5S (([[UIScreen mainScreen] bounds].size.width == 320) && ([[UIScreen mainScreen] bounds].size.height == 568))
#define IPHONE6 (([[UIScreen mainScreen] bounds].size.width == 375) && ([[UIScreen mainScreen] bounds].size.height == 667))
#define IPHONE6P (([[UIScreen mainScreen] bounds].size.width == 414) && ([[UIScreen mainScreen] bounds].size.height == 736))

@implementation UIView (Extension)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setSize:(CGSize)size
{
//    self.width = size.width;
//    self.height = size.height;
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}
-(void) setCorner:(float) r
{
    if (r < 0 )
    {
        r = 0 ;
    }
    self.layer.cornerRadius = r ;
    self.layer.masksToBounds = YES ;
}
+(UIView *)createLineView:(UIView *)superView
{
   return [self createLineView:superView frame:CGRectMake(0, superView.height - 0.5, gScreenWidth, 0.5)];
}
+(UIView *)createLineViewInTop:(UIView *)superView
{
   return [self createLineView:superView frame:CGRectMake(0, 0, gScreenWidth, 0.5)];
}
+(UIView *)createLineViewInbottom:(UIView *)superView
{
    return [self createLineView:superView frame:CGRectMake(0, superView.height - 0.5, gScreenWidth, 0.5)];
}
+(UIView *)createLineView:(UIView *)superView frame:(CGRect)rect
{
    UIView *line = [[UIView alloc]initWithFrame:rect];
    line.backgroundColor = [UIColor grayColor];
    line.alpha = .18;
    [superView addSubview:line];
    return line;
}

+ (void)createTapGestureInView:(UIView *)view target:(id)target action:(SEL)selector
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    [view addGestureRecognizer:tap];
}

+(CGRect)getRectWithX:(CGFloat)x Y:(CGFloat)y width:(CGFloat)width andHeight:(CGFloat)height{
    CGRect rect = CGRectZero;
    CGFloat height5s = 568.;
    CGFloat width5s = 320.;
    
    if (IPHONE4S) {
        rect = CGRectMake(x, 480/height5s *y, width, 480/height5s*height);
    }else if (IPHONE5S){
        rect = CGRectMake(x, y, width, height);
    }else if(IPHONE6){
        rect = CGRectMake(375/width5s*x, 667/height5s*y, 375/width5s*width, 667/height5s*height);
    }else{
        rect = CGRectMake(414/width5s*x, 736/height5s*y, 414/width5s*width, 736/height5s*height);
    }
    return rect;
}
- (UIView*)subViewOfClassName:(NSString*)className {
    for (UIView* subView in self.subviews) {
        if ([NSStringFromClass(subView.class) isEqualToString:className]) {
            return subView;
        }
        
        UIView* resultFound = [subView subViewOfClassName:className];
        if (resultFound) {
            return resultFound;
        }
    }
    return nil;
}

@end
