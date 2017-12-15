//
//  UIColor+Extension.m
//  LHVideo
//
//  Created by Lion on 16/1/19.
//  Copyright © 2016年 Lion. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+(UIColor *)colorWithRGB:(int)color alpha:(float)alpha
{
    return [UIColor colorWithRed:((Byte)(color >> 16))/255.0 green:((Byte)(color >> 8))/255.0 blue:((Byte)color)/255.0 alpha:alpha];
}

@end
