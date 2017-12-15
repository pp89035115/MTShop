//
//  NSString+Extension.h
//  LYShop
//
//  Created by Lion on 16/7/8.
//  Copyright © 2016年 LionYang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    timeStrTypeDefault,
    timeStrTypeHH,
    timeStrTypeMin,
    timeStrTypeSS,
    timeStrTypeDate,
} timeStrType;
@interface NSString (Extension)

- (NSString *)timestampWithTimeStr:(NSString *)timeStr
                           StrType:(timeStrType )type;

- (NSString *)getCurrentTimeStr;

+ (NSString *)md5:(NSString *)input;

+ (NSString *)getNowTimeTimestamp;//获取当前时间戳 精确到秒

+ (NSString *)convertToJsonData:(NSDictionary *)dict;

+ (NSString*)dictionaryToJson:(NSDictionary *)dic;

@end
