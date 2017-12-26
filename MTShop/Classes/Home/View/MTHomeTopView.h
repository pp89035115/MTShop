//
//  MTHomeTopView.h
//  MTShop
//
//  Created by DQ_Yang on 2017/12/26.
//  Copyright © 2017年 MT. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MTHomeTopView;
@protocol MTHomeTopViewDelegate <NSObject>
- (void)topViewCityButtonClick:(MTHomeTopView *)topView;
- (void)topViewSearchButtonClick:(MTHomeTopView *)topView;
- (void)topViewQiandaoButtonClick:(MTHomeTopView *)topView;
@end

@interface MTHomeTopView : UIView
@property (nonatomic ,weak)id<MTHomeTopViewDelegate>delegate;
@property (nonatomic ,strong)UIButton *cityButton;
@property (nonatomic ,strong)UIButton *searchButton;
@property (nonatomic ,strong)UIButton *qianDaoButton;
@end
