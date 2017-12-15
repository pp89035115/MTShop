//
//  UIColor+LHExtension.h
//  BaiHaiShop
//
//  Created by Bai_Hai_LionYang on 2016/10/8.
//  Copyright © 2016年 LionYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LHExtension)

+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色

//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
