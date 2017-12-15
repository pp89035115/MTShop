//
//  MTTabBarController.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/15.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTTabBarController.h"
#import "MTNavigationController.h"
#import "MTTabBar.h"

@interface MTTabBarController ()
@property (nonatomic ,strong)MTHomeController *homeVc;
@property (nonatomic ,strong)MTNearbyController *nearbyVc;
@property (nonatomic ,strong)MTPublishController *publishVc;
@property (nonatomic ,strong)MTMessageController *messageVc;
@property (nonatomic ,strong)MTMineController *mineVc;
@end

@implementation MTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
}

- (void)setupSubViews
{
    //设置tabbar按钮默认样式
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    //设置tabbar按钮点击样式
    NSMutableDictionary *selectAttrs = [NSMutableDictionary dictionary];
    selectAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    selectAttrs[NSForegroundColorAttributeName] = MTMainColor;
    
    //更换tabbar样式
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
    
    MTHomeController *homeVc = [[MTHomeController alloc]init];
    self.homeVc = homeVc;
    
    MTNearbyController *nearbyVc = [[MTNearbyController alloc]init];
    self.nearbyVc = nearbyVc;
    
    MTPublishController *pubilshVc = [[MTPublishController alloc]init];
    self.publishVc = pubilshVc;
    
    MTMessageController *messageVc = [[MTMessageController alloc]init];
    self.messageVc =messageVc;
    
    MTMineController *mineVc = [[MTMineController alloc]init];
    self.mineVc = mineVc;
}

#pragma mark - 绑定tabbar按钮和controller
- (void)setupChildVc:(UIViewController *)controller
           WithTitle:(NSString *)title
               Image:(NSString *)image
         SelectImage:(NSString *)selectImage
{
    MTNavigationController *nav = [[MTNavigationController alloc]initWithRootViewController:controller];
    [nav.navigationBar setBarTintColor:MTMainColor];
    NSDictionary * dict=[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    nav.navigationBar.titleTextAttributes = dict;
    [nav.navigationBar setTintColor:[UIColor whiteColor]];
    controller.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:image];
    UIImage *seleImage =  [UIImage imageNamed:selectImage];
    seleImage = [seleImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.selectedImage = seleImage;
    [self addChildViewController:nav];
}

@end
