//
//  MTRequest.m
//  MTShop
//
//  Created by Lion on 2018/1/29.
//  Copyright © 2018年 MT. All rights reserved.
//

#import "MTRequest.h"
#import "SVProgressHUD.h"

@implementation MTRequest
+ (void)GET:(NSString *)URLString
 parameters:(id)parameters
    success:(void (^)(id))success
    failure:(void (^)(NSError *))failure
{
    NSLog(@"+++++requestUrl : %@ ",URLString);
    NSLog(@"++++ requestParamter : %@ ++++",parameters);
    
    if ([parameters isKindOfClass:[NSNull class]] || parameters == nil) {}else{}
    // 创建请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    [SVProgressHUD showWithStatus:@"加载中..."];
    [mgr GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            success(obj);
        }
        [SVProgressHUD dismissWithDelay:.5];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
    }];
}

+ (void)Post:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id))success
     failure:(void (^)(NSError *))failure
{
    NSLog(@"+++++requestUrl : %@ ++++++",URLString);
    NSLog(@"++++ requestParamter : %@ ++++",parameters);
    
    // 创建请求管理者
    if ([parameters isKindOfClass:[NSNull class]] || parameters == nil) {}else{}
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.responseSerializer = [AFHTTPResponseSerializer serializer];
    [SVProgressHUD showWithStatus:@"加载中..."];
    [mgr POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            NSDictionary *obj = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            success(obj);
        }
        [SVProgressHUD dismissWithDelay:.5];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
    }];
}
@end
