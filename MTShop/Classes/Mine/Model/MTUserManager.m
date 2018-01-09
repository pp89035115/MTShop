//
//  MTUserManager.m
//  MTShop
//
//  Created by DQ_Yang on 2018/1/8.
//  Copyright © 2018年 MT. All rights reserved.
//

#import "MTUserManager.h"
#import "NSDictionary+BHExtension.h"
#import "MTLoginController.h"

static NSString * const KEY_USERDATA = @"userData";
static NSString * const KEY_USERID = @"sid";
static NSString * const KEY_USERNAME = @"username";
static NSString * const KEY_USERPASSWORD = @"password";

@implementation MTUserManager
+ (void)saveUserData:(NSDictionary *)userData{
    
    NSDictionary *user = [userData deleteAllNullValue];
    [[NSUserDefaults standardUserDefaults]setObject:user forKey:KEY_USERDATA];
};

+ (NSDictionary *)readUserData{
    return [[NSUserDefaults standardUserDefaults]objectForKey:KEY_USERDATA];
};

+ (void)deleteUserData
{
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:KEY_USERDATA];
}

+ (NSString *)userId{
    return [[MTUserManager readUserData]objectForKey:KEY_USERID];
};

+ (MTUser *)user{
    return [MTUser mj_objectWithKeyValues:[MTUserManager readUserData]];
};

+ (BOOL)isLogin{
    if ([MTUserManager userId].length && ![[MTUserManager userId]isKindOfClass:[NSNull class]])
    {return YES;}else{return NO;}
};

+ (void)gotoLoginView:(UIViewController *)controller{
    MTLoginController *loginVc = [[MTLoginController alloc]init];
    loginVc.hidesBottomBarWhenPushed = YES;
    [controller.navigationController pushViewController:loginVc animated:YES];
};

@end
