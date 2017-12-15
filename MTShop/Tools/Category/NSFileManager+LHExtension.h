//
//  NSFileManager+LHExtension.h
//  WNShop
//
//  Created by Lion on 16/5/24.
//  Copyright © 2016年 LionYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (LHExtension)
/**
 *  获取缓存大小
 *
 *  @param filePath 缓存地址
 *
 *  @return 缓存大小
 */
+ (long long)fileSizeAtPath:(NSString*)filePath;

/**
 *  遍历文件夹获取缓存大小
 *
 *  @param folderPath 文件夹地址
 *
 *  @return 缓存大小
 */
+ (float )folderSizeAtPath:(NSString*) folderPath;

@end
