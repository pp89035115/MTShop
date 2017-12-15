//
//  MTBaseTableViewCell.h
//  MTShop
//
//  Created by DQ_Yang on 2017/12/15.
//  Copyright © 2017年 MT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+Extension.h"

@interface MTBaseTableViewCell : UITableViewCell

+ (CGFloat)getCellHeight;
- (void)setupSubViews;
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic ,strong)UILabel *childLabel;

@end
