//
//  MTQiandaoView.h
//  MTShop
//
//  Created by DQ_Yang on 2017/12/26.
//  Copyright © 2017年 MT. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MTQiandaoView;

@interface MTQiandaoView : UIView

@property (nonatomic, copy) void(^qiandaoButtonActionBlock)(MTQiandaoView *qiandaoView);
@property (nonatomic, copy) void(^qiandaoGuizeActionBlock)(MTQiandaoView *qiandaoView);

@end
