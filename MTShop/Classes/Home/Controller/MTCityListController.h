//
//  MTCityListController.h
//  MTShop
//
//  Created by DQ_Yang on 2017/12/26.
//  Copyright © 2017年 MT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MTCityModel.h"

@protocol MTCityListControllerDelegate <NSObject>

- (void)mt_cityListSelectedCity:(NSString *)selectedCity Id:(NSInteger)Id;

@end

@interface MTCityListController : UIViewController
/** 城市model */
@property (strong, nonatomic) MTCityModel *cityModel;
/** 代理 */
@property (weak, nonatomic) id<MTCityListControllerDelegate> delegate;
@end
