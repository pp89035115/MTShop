//
//  MTUserManager.h
//  MTShop
//
//  Created by DQ_Yang on 2018/1/8.
//  Copyright © 2018年 MT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTUser.h"
@interface MTUserManager : NSObject

+ (void)saveUserData:(NSDictionary *)userData;
+ (NSDictionary *)readUserData;
+ (void)deleteUserData;
+ (NSString *)userId;
+ (MTUser *)user;

+ (BOOL)isLogin;
+ (void)gotoLoginView:(UIViewController *)controller;

@end

