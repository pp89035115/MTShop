//
//  MTHomeModel.h
//  MTShop
//
//  Created by DQ_Yang on 2017/12/15.
//  Copyright © 2017年 MT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTFootmark : NSObject
@property (nonatomic ,copy)NSString *name;
@property (nonatomic ,copy)NSString *Id;
@end

@interface MTSlide : NSObject
@property (nonatomic ,copy)NSString *image;
@property (nonatomic ,copy)NSString *action;
@property (nonatomic ,copy)NSString *action_params;
@end

@interface MTBrand : NSObject
@property (nonatomic ,copy)NSString *image;
@property (nonatomic ,copy)NSString *action;
@property (nonatomic ,copy)NSString *action_params;
@end

@interface MTSelling :NSObject
@property (nonatomic ,copy)NSString *Id;
@property (nonatomic ,copy)NSString *name;
@property (nonatomic ,copy)NSString *image;
@property (nonatomic ,copy)NSString *type;
@property (nonatomic ,copy)NSString *grade;
@property (nonatomic ,copy)NSString *price;
@property (nonatomic ,copy)NSString *spec;
@property (nonatomic ,copy)NSString *is_vip;
@end

@interface MTAlways : NSObject
@property (nonatomic ,copy)NSString *Id;
@property (nonatomic ,copy)NSString *name;
@property (nonatomic ,copy)NSString *spec;
@property (nonatomic ,copy)NSString *city;
@property (nonatomic ,copy)NSString *Description;
@end

@interface MTHomeModel : NSObject
@property (nonatomic ,copy)NSArray *footmark;
@property (nonatomic ,copy)NSArray *slide;
@property (nonatomic ,copy)NSArray *brand;
@property (nonatomic ,copy)NSArray *selling;
@property (nonatomic ,copy)NSArray *always;
@end
