//
//  UIColor+Extension.h
//  LHVideo
//
//  Created by Lion on 16/1/19.
//  Copyright © 2016年 Lion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

+(UIColor *)colorWithRGB:(int)color alpha:(float)alpha;

+ (UIColor *)randomColor;
+ (instancetype)r:(uint8_t)r g:(uint8_t)g b:(uint8_t)b alphaComponent:(CGFloat)alpha;
+ (instancetype)r:(uint8_t)r g:(uint8_t)g b:(uint8_t)b;
+ (instancetype)r:(uint8_t)r g:(uint8_t)g b:(uint8_t)b a:(uint8_t)a;
+ (instancetype)rgba:(NSUInteger)rgba;
+ (instancetype)colorWithHexString:(NSString*)hexString;
- (NSUInteger)rgbaValue;


@end
