//
//  MTShopMacro.h
//  MTShop
//
//  Created by DQ_Yang on 2017/12/15.
//  Copyright © 2017年 MT. All rights reserved.
//

#ifndef MTShopMacro_h
#define MTShopMacro_h

#define LHKeyWindow [UIApplication sharedApplication].keyWindow

#define IOS9Later   (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) ? 1 : 0)
#define IOS8Later   (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) ? 1 : 0)
#define IOS7Later   (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? 1 : 0)
#define IOS6Later   (([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) ? 1 : 0)

#define IPHONE4S (([[UIScreen mainScreen] bounds].size.width == 320) && ([[UIScreen mainScreen] bounds].size.height == 480))
#define IPHONE5S (([[UIScreen mainScreen] bounds].size.width == 320) && ([[UIScreen mainScreen] bounds].size.height == 568))
#define IPHONE6 (([[UIScreen mainScreen] bounds].size.width == 375) && ([[UIScreen mainScreen] bounds].size.height == 667))
#define IPHONE6P (([[UIScreen mainScreen] bounds].size.width == 414) && ([[UIScreen mainScreen] bounds].size.height == 736))
// iPhone X
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define k_iPhoneX (kScreenWidth == 375.f && kScreenHeight == 812.f ? YES : NO)
#define kScreenStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define kScreenNavigationBarHeight 44.f
#define kScreenTopStatusNaviHeight (kScreenStatusBarHeight + kScreenNavigationBarHeight)
#define kScreenTabBarHeight (k_iPhoneX ? (49.f+34.f) : 49.f)


#ifdef DEBUG // 调试状态, 打开LOG功能
#define LHLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else // 发布状态, 关闭LOG功能
#define LHLog(...)
#endif

//DEBUG  模式下打印日志,当前行 并弹出一个警告
#ifdef DEBUG
#   define LHAlertLog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define LHAlertLog(...)
#endif

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define gScreenHeight   [UIScreen mainScreen].bounds.size.height
#define gScreenWidth    [UIScreen mainScreen].bounds.size.width
#define gScreenRect     [UIScreen mainScreen].bounds

//自定义颜色
#define LHColor(r,g,b) [UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:1.]

#define LHColorA(r,g,b,a) [UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:a]

#define LHSeperatorColor LHColor(228, 229, 230)
#define LHMainColor LHColor (241,83,83)
// 随机色
#define LHRandomColor LHColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

//透明色
#define LHClearColor [UIColor clearColor]

#define LHGRAYCOLOR LHColor(203, 204, 205)

#define LHKeyWindow [UIApplication sharedApplication].keyWindow

#define IOS9Later   (([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0) ? 1 : 0)
#define IOS8Later   (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) ? 1 : 0)
#define IOS7Later   (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? 1 : 0)
#define IOS6Later   (([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0) ? 1 : 0)

#define IPHONE4S (([[UIScreen mainScreen] bounds].size.width == 320) && ([[UIScreen mainScreen] bounds].size.height == 480))
#define IPHONE5S (([[UIScreen mainScreen] bounds].size.width == 320) && ([[UIScreen mainScreen] bounds].size.height == 568))
#define IPHONE6 (([[UIScreen mainScreen] bounds].size.width == 375) && ([[UIScreen mainScreen] bounds].size.height == 667))
#define IPHONE6P (([[UIScreen mainScreen] bounds].size.width == 414) && ([[UIScreen mainScreen] bounds].size.height == 736))

#ifdef DEBUG // 调试状态, 打开LOG功能
#define LHLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else // 发布状态, 关闭LOG功能
#define LHLog(...)
#endif

//DEBUG  模式下打印日志,当前行 并弹出一个警告
#ifdef DEBUG
#   define LHAlertLog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define LHAlertLog(...)
#endif

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

#define gScreenHeight   [UIScreen mainScreen].bounds.size.height
#define gScreenWidth    [UIScreen mainScreen].bounds.size.width
#define gScreenRect     [UIScreen mainScreen].bounds

//自定义颜色
#define LHColor(r,g,b) [UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:1.]

#define LHColorA(r,g,b,a) [UIColor colorWithRed:(r)/255. green:(g)/255. blue:(b)/255. alpha:a]

#define LHBuildSeperatorColor LHColor(228, 229, 230)

// 随机色
#define LHRandomColor LHColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

//透明色
#define LHClearColor [UIColor clearColor]

#define LHGRAYCOLOR LHColor(203, 204, 205)

//用户图片按比例获取高度
#define  gGiveHeight(HEIGHT) HEIGHT * [UIScreen mainScreen].bounds.size.height/568.0

//按比例获取宽度
#define  gGiveWidth(WIDTH) WIDTH * [UIScreen mainScreen].bounds.size.width/320.0

//用户图片按比例获取高度
#define  gGiveHeight(HEIGHT) HEIGHT * [UIScreen mainScreen].bounds.size.height/568.0

//按比例获取宽度
#define  gGiveWidth(WIDTH) WIDTH * [UIScreen mainScreen].bounds.size.width/320.0

// weakSelf
#define LHWeakSelf __weak typeof(self) weakSelf = self
//FUNCTION
#define LHFUNCTION   NSLog(@"%s",__FUNCTION__);
//font
#define Font(f)  [UIFont systemFontOfSize:f]



#endif /* MTShopMacro_h */
