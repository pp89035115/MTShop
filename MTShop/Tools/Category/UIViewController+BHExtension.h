//
//  UIViewController+BHExtension.h
//  BaiHaiShop
//
//  Created by Bai_Hai_LionYang on 2016/11/21.
//  Copyright © 2016年 LionYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BackButtonHandlerProtocol <NSObject>

@optional

-(BOOL)navigationShouldPopOnBackButton;

@end

@interface UIViewController (BHExtension)
<
    BackButtonHandlerProtocol
>

@end
 
