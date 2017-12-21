//
//  zhFullView.h
//  zhPopupControllerDemo
//
//  Created by zhanghao on 2016/12/27.
//  Copyright © 2017年 zhanghao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "zhIconLabel.h"
#import "UIView+Layout.h"
#import "UIColor+Extension.h"
#import "NSDate+Extend.h"
#import "UIScreen+Extend.h"
#define ROW_COUNT 2 // 每行显示4个
#define ROWS 2      // 每页显示2行
#define PAGES 1     // 共1页

@interface zhFullView : UIView

@property (nonatomic, assign) CGSize itemSize;
@property (nonatomic, strong) NSArray<zhIconLabelModel *> *models;
@property (nonatomic, strong, readonly) NSMutableArray<zhIconLabel *> *items;

@property (nonatomic, copy) void (^didClickFullView)(zhFullView *fullView);
@property (nonatomic, copy) void (^didClickItems)(zhFullView *fullView, NSInteger index);

- (void)endAnimationsCompletion:(void (^)(zhFullView *fullView))completion; // 动画结束后执行block

@end
