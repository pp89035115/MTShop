//
//  MTCityModel.h
//  MTShop
//
//  Created by DQ_Yang on 2017/12/28.
//  Copyright © 2017年 MT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@class MTCity;
@class MTCityList;

@interface MTCityModel : NSObject
/** 热门城市 */
@property (strong, nonatomic) NSArray<MTCity *> *hotCity;
/** 城市列表 */
@property (strong, nonatomic) NSArray<MTCityList *> *list;
/** 选中城市 */
@property (copy, nonatomic) NSString *selectedCity;
/** 选中城市ID */
@property (assign, nonatomic) NSInteger selectedCityId;
/** 高度 */
@property (assign, nonatomic) CGFloat hotCellH;

@end


@interface MTCityList : NSObject
/** 城市数组 */
@property (strong, nonatomic) NSArray<MTCity *> *citys;
/** 首字母 */
@property (copy, nonatomic) NSString *initial;

@end

@interface MTCity : NSObject
/** 城市 */
@property (copy, nonatomic) NSString *name;
/** ID */
@property (assign, nonatomic) NSInteger Id;
/** 是否被选中 */
@property (assign, nonatomic, getter=isSelected) BOOL selected;

@end
