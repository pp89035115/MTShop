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
#import <zhPopupController/zhPopupController.h>
#import "zhFullView.h"
#import "zhIconLabel.h"
@interface MTTabBarController ()
<
    UITabBarControllerDelegate,
    zhPopupControllerDelegate
>
@property (nonatomic ,strong)MTHomeController *homeVc;
@property (nonatomic ,strong)MTNearbyController *nearbyVc;
@property (nonatomic ,strong)MTPublishController *publishVc;
@property (nonatomic ,strong)MTMessageController *messageVc;
@property (nonatomic ,strong)MTMineController *mineVc;
@end

@implementation MTTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
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
    [self setupChildVc:homeVc WithTitle:@"首页" Image:@"tabBarHome" SelectImage:@"tabBarHome_h"];
    self.homeVc = homeVc;
    
    MTNearbyController *nearbyVc = [[MTNearbyController alloc]init];
    [self setupChildVc:nearbyVc WithTitle:@"附近" Image:@"tabBarNearby" SelectImage:@"tabBarNearby_h"];
    self.nearbyVc = nearbyVc;
    
    MTPublishController *pubilshVc = [[MTPublishController alloc]init];
    [self setupChildVc:pubilshVc WithTitle:@"发布" Image:@"tabBarPublish" SelectImage:@"tabBarPublish_h"];
    pubilshVc.tabBarItem.tag = 2;
    self.publishVc = pubilshVc;
    
    MTMessageController *messageVc = [[MTMessageController alloc]init];
    [self setupChildVc:messageVc WithTitle:@"消息" Image:@"tabBarMessage" SelectImage:@"tabBarMessage_h"];
    self.messageVc =messageVc;
    
    MTMineController *mineVc = [[MTMineController alloc]init];
    [self setupChildVc:mineVc WithTitle:@"我的" Image:@"tabBarMine" SelectImage:@"tabBarMine_h"];
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

#pragma mark - <UITabBarControllerDelegate>

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if (viewController.tabBarItem.tag == 2) {
        
        [self presentPublish];
        return NO;
    }else
    {
        return YES;
    }
}

//跳转到发布
- (void)presentPublish
{
    zhFullView *full = [self fullView];
    full.didClickFullView = ^(zhFullView * _Nonnull fullView) {
        [self.zh_popupController dismiss];
    };
    
    full.didClickItems = ^(zhFullView *fullView, NSInteger index) {
        
        NSLog(@"++++ index: %ld ",index);
        __weak typeof(self) weak_self = self;
        self.zh_popupController.didDismiss = ^(zhPopupController * _Nonnull popupController) {
            
            
            LHFUNCTION
        };
        
        [fullView endAnimationsCompletion:^(zhFullView *fullView) {
            [weak_self.zh_popupController dismiss];
        }];
    };
    
    self.zh_popupController = [zhPopupController popupControllerWithMaskType:zhPopupMaskTypeWhiteBlur];
    self.zh_popupController.allowPan = YES;
    [self.zh_popupController presentContentView:full];
}

- (zhFullView *)fullView {
    
    zhFullView *fullView = [[zhFullView alloc] initWithFrame:self.view.frame];
    NSArray *array = @[@"长期主营销售产品",@"长期主营采购产品",@"现货实时销售",@"现货实时采购",@""];
    NSMutableArray *models = [NSMutableArray arrayWithCapacity:array.count];
    for (NSString *string in array) {
        zhIconLabelModel *item = [zhIconLabelModel new];
        item.icon = [UIImage imageNamed:[NSString stringWithFormat:@"sina_%@", string]];
        item.text = string;
        [models addObject:item];
    }
    fullView.models = models;
    return fullView;
}

@end
