//
//  MTMineView.h
//  MTShop
//
//  Created by DQ_Yang on 2017/12/15.
//  Copyright © 2017年 MT. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MTMineView;
@protocol MTMineViewDelegate <NSObject>
- (void)mt_mineViewAvatarClick:(MTMineView *)mineView;
- (void)mt_mineViewSettingClick:(MTMineView *)mineView;
@end

@interface MTMineView : UICollectionReusableView
@property (nonatomic ,weak)id<MTMineViewDelegate>delegate;
@end
