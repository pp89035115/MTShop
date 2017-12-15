//
//  UIImage+BHImageColor.m
//  BaiHaiShop
//
//  Created by Bai_Hai_LionYang on 2016/12/21.
//  Copyright © 2016年 LionYang. All rights reserved.
//

#import "UIImage+BHImageColor.h"

@implementation UIImage (BHImageColor)

+ (UIImage*) GetImageWithColor:(UIColor*)color andHeight:(CGFloat)height
{
    CGRect r= CGRectMake(0.0f, 0.0f, 1.0f, height);
    UIGraphicsBeginImageContext(r.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, r);
    
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}

@end
