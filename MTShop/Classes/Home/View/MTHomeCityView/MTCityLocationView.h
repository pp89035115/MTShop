//
//  MTCityLocationView.h
//  MTShop
//
//  Created by DQ_Yang on 2017/12/28.
//  Copyright © 2017年 MT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MTCityLocationView : UIView

+ (instancetype)cityLocationView;
/** 定位城市 */
@property (strong, nonatomic) UIButton *cityButton;
/** 重新定位按钮 */
@property (strong, nonatomic) UIButton *locationButton;
/** 定位城市 */
@property (strong, nonatomic) NSString *locationCity;
@end
