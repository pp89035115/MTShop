//
//  UIKitExtend.h
//
//  Created by zhouyuan on 14-5-22.
//  Copyright (c) 2014年 Yuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UILabel (CreateLabel)
+ (id) createLabelWithText:(NSString *)text
                     frame:(CGRect)rect textAlignment:(NSTextAlignment)textAlignment backColor:(UIColor *)backColor textColor:(UIColor *)textColor font:(UIFont *)font;

+ (id) createLabelWithFrame:(CGRect)rect
              textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)color font:(UIFont *)font;

+ (id) createLabelWithFrame:(CGRect)rect textColor:(UIColor *)color font:(UIFont *)font;

+ (id) createLabelWithFrame:(CGRect)rect;

+ (id) createLabelWithText:(NSString *)text frame:(CGRect)rect font:(UIFont *)font;

+ (id) createLabelWithText:(NSString *)text;

+ (id) createLabel;

@end

@interface UIImageView (CreateImageView)
+ (id) createImageViewWithImage:(UIImage *)image
                          frame:(CGRect)rect userEnabled:(BOOL)isEnabled;

+ (id) createImageViewWithImage:(UIImage *)image
                          frame:(CGRect)rect;

+ (id) createImageViewWithName:(NSString *)name
                         frame:(CGRect)rect;

+ (id) createImageViewWithImage:(UIImage *)image
                          frame:(CGRect)rect gesture:(UIGestureRecognizer *)gesture;

+ (id) createImageViewWithFrame:(CGRect)rect;

+ (id) createImageViewWithFrame:(CGRect)rect imageName:(NSString *)imageName leftCapWidth:(CGFloat)leftCapWidth topCapHeight:(CGFloat)topCapHeight;

+ (id) createImageView;
@end

@interface UIButton (CreateUIButton)
+ (id) createButtonWithTitle:(NSString *)title
                  buttonType:(UIButtonType)btnType
                       frame:(CGRect)rect titleFont:(UIFont *)font titleColor:(UIColor *)titleColor backColor:(UIColor *)backColor;

+ (id) createButtonWithTitle:(NSString *)title
                       frame:(CGRect)rect titleFont:(UIFont *)font titleColor:(UIColor *)titleColor;

+ (id) createButtonWithTitle:(NSString *)title
                   titleFont:(UIFont *)font titleColor:(UIColor *)titleColor;
+ (id) createButton;

+ (id) createButtonWithImage:(UIImage *)image frame:(CGRect)rect;

+ (id) createButtonWithImageName:(NSString *)imageName
                           frame:(CGRect)rect;

+ (id) createButtonWithImage:(UIImage *)image;

+ (id) createButtonWithImageName:(NSString *)imageName;

+ (id) createButtonWithBackImage:(UIImage *)image frame:(CGRect)rect;
+ (id) createButtonWithBackImageName:(NSString *)imageName
                               frame:(CGRect)rect;

+ (id) createButtonWithBackImage:(UIImage *)image;

+ (id) createButtonWithBackImageName:(NSString *)imageName;

+ (id) createButtonWithBackImage:(UIImage *)image
                    leftCapWidth:(CGFloat)leftCapWidth topCapHeight:(CGFloat)topCapHeight
                           frame:(CGRect)rect title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont;

+ (id) createButtonWithBackImage:(UIImage *)image
                    leftCapWidth:(CGFloat)leftCapWidth topCapHeight:(CGFloat)topCapHeight
                           frame:(CGRect)rect;
@end

