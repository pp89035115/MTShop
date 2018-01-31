//
//  MTHomeModel.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/15.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTHomeModel.h"

@implementation MTFootmark
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"Id":@"id"};
}
@end

@implementation MTSlide

@end

@implementation MTBrand

@end

@implementation MTSelling
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"Id":@"id"};
}
@end

@implementation MTAlways
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"Id":@"id",
             @"Description":@"description"
             };
}
@end

@implementation MTHomeModel

@end
