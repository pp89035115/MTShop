//
//  MTCityModel.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/28.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTCityModel.h"
#import "MTCityMacros.h"

@implementation MTCityModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"list": [MTCityList class], @"hotCity" : [MTCity class]};
}
@end

@implementation MTCityList

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"citys": [MTCity class]};
}
@end


@implementation MTCity

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"Id": @"id"};
}


@end
