//
//  UIKitExtend.m
//
//  Created by zhouyuan on 14-5-22.
//  Copyright (c) 2014年 Yuan. All rights reserved.
//

#import "UIKitExtend.h"
@implementation UILabel (CreateLabel)

+ (id) createLabelWithText:(NSString *)text frame:(CGRect)rect textAlignment:(NSTextAlignment)textAlignment backColor:(UIColor *)backColor textColor:(UIColor *)textColor font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc]initWithFrame:rect];
    label.backgroundColor = backColor;
    label.textAlignment = textAlignment;
    label.textColor = textColor;
    label.font = font;
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.text = text;
    return label;
}
+ (id) createLabelWithFrame:(CGRect)rect textAlignment:(NSTextAlignment)textAlignment textColor:(UIColor *)color font:(UIFont *)font
{
    return [self createLabelWithText:nil frame:rect textAlignment:textAlignment backColor:[UIColor clearColor] textColor:color font:font];
}
+ (id) createLabelWithFrame:(CGRect)rect textColor:(UIColor *)color font:(UIFont *)font
{
    return [self createLabelWithFrame:rect textAlignment:NSTextAlignmentLeft textColor:color font:font];
}
+ (id) createLabelWithFrame:(CGRect)rect
{
    return [self createLabelWithFrame:rect textColor:nil font:nil];
}
+ (id) createLabelWithText:(NSString *)text frame:(CGRect)rect font:(UIFont *)font
{
    return [self createLabelWithText:text frame:rect textAlignment:NSTextAlignmentLeft backColor:[UIColor clearColor] textColor:[UIColor blackColor] font:font];
}
+ (id) createLabelWithText:(NSString *)text
{
    return [self createLabelWithText:text frame:CGRectZero font:nil];
}
+ (id) createLabel
{
    return [self createLabelWithText:nil];
}
@end

@implementation UIImageView (CreateImageView)
+ (id) createImageViewWithImage:(UIImage *)image frame:(CGRect)rect userEnabled:(BOOL)isEnabled
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.image = image;
    imageView.userInteractionEnabled = isEnabled;
    return imageView;
}

+ (id) createImageViewWithImage:(UIImage *)image frame:(CGRect)rect
{
    return [self createImageViewWithImage:image frame:rect userEnabled:NO];
}
+ (id) createImageView
{
    return [self createImageViewWithImage:nil frame:CGRectZero];
}
+ (id) createImageViewWithFrame:(CGRect)rect
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:rect];
    imageView.backgroundColor = [UIColor clearColor];
    return imageView;
}
+ (id) createImageViewWithFrame:(CGRect)rect imageName:(NSString *)imageName leftCapWidth:(CGFloat)leftCapWidth topCapHeight:(CGFloat)topCapHeight
{
    UIImageView *imageView = [UIImageView createImageViewWithFrame:rect];
    UIImage *image = [UIImage imageNamed:imageName];
    image = [image stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
    imageView.image = image;
    return imageView;
}
+ (id) createImageViewWithName:(NSString *)name frame:(CGRect)rect
{
    return [self createImageViewWithImage:[UIImage imageNamed:name] frame:rect];
}
+ (id) createImageViewWithImage:(UIImage *)image frame:(CGRect)rect gesture:(UIGestureRecognizer *)gesture
{
    UIImageView *imageView = [self createImageViewWithImage:image frame:rect userEnabled:YES];
    [imageView addGestureRecognizer:gesture];
    return imageView;
}
@end

@implementation UIButton (CreateButton)
+ (id) createButtonWithTitle:(NSString *)title buttonType:(UIButtonType)btnType frame:(CGRect)rect titleFont:(UIFont *)font titleColor:(UIColor *)titleColor backColor:(UIColor *)backColor
{
    UIButton *btn = [UIButton buttonWithType:btnType];
    btn.backgroundColor = backColor;
    btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    btn.titleLabel.font = font;
    btn.frame = rect;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    return btn;
}
+ (id) createButtonWithTitle:(NSString *)title frame:(CGRect)rect titleFont:(UIFont *)font titleColor:(UIColor *)titleColor
{
    return [self createButtonWithTitle:title buttonType:UIButtonTypeCustom frame:rect titleFont:font titleColor:titleColor backColor:[UIColor clearColor]];
}
+ (id) createButtonWithTitle:(NSString *)title titleFont:(UIFont *)font titleColor:(UIColor *)titleColor
{
    return [self createButtonWithTitle:title frame:CGRectZero titleFont:font titleColor:titleColor];
}
+ (id) createButton
{
    return [self createButtonWithTitle:nil titleFont:nil titleColor:nil];
}

+ (id) createButtonWithImage:(UIImage *)image frame:(CGRect)rect
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = rect;
    [btn setImage:image forState:UIControlStateNormal];
    return btn;
}

+ (id) createButtonWithImageName:(NSString *)imageName frame:(CGRect)rect
{
    return [self createButtonWithImage:[UIImage imageNamed:imageName] frame:rect];
}

+ (id) createButtonWithImage:(UIImage *)image
{
    return [self createButtonWithImage:image frame:CGRectZero];
}

+ (id) createButtonWithImageName:(NSString *)imageName
{
    return [self createButtonWithImage:[UIImage imageNamed:imageName]];
}

+ (id) createButtonWithBackImage:(UIImage *)image frame:(CGRect)rect
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = rect;
    [btn setBackgroundImage:image forState:UIControlStateNormal];
    return btn;
}

+ (id) createButtonWithBackImageName:(NSString *)imageName frame:(CGRect)rect
{
    return [self createButtonWithBackImage:[UIImage imageNamed:imageName] frame:rect];
}

+ (id) createButtonWithBackImage:(UIImage *)image
{
    return [self createButtonWithBackImage:image frame:CGRectZero];
}

+ (id) createButtonWithBackImageName:(NSString *)imageName
{
    return [self createButtonWithBackImage:[UIImage imageNamed:imageName]];
}
+ (id) createButtonWithBackImage:(UIImage *)image leftCapWidth:(CGFloat)leftCapWidth topCapHeight:(CGFloat)topCapHeight frame:(CGRect)rect title:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont
{
    UIButton *backBtn = [self createButtonWithTitle:title frame:rect titleFont:titleFont titleColor:titleColor];
    image = [image stretchableImageWithLeftCapWidth:leftCapWidth topCapHeight:topCapHeight];
    [backBtn setBackgroundImage:image forState:UIControlStateNormal];
    return backBtn;
}
+ (id) createButtonWithBackImage:(UIImage *)image leftCapWidth:(CGFloat)leftCapWidth topCapHeight:(CGFloat)topCapHeight frame:(CGRect)rect
{
    return [self createButtonWithBackImage:image leftCapWidth:leftCapWidth topCapHeight:topCapHeight frame:rect title:nil titleColor:nil titleFont:nil];
}
@end




