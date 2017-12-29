//
//  MTHomeSearchController.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/28.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTHomeSearchController.h"

@interface MTHomeSearchController ()

@end

@implementation MTHomeSearchController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIView *searchView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, gScreenWidth / 4 * 3, 30)];
    searchView.backgroundColor = [UIColor whiteColor];
    searchView.layer.cornerRadius = 5.f;
    UIButton *changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    changeButton.frame = CGRectMake(0, 0, 60, 30);
    changeButton.backgroundColor = LHClearColor;
    changeButton.titleLabel.font = Font(13);
    [changeButton setImage:[UIImage imageNamed:@"home_city_more"] forState:UIControlStateNormal];
    [changeButton setTitle:@"实时" forState:UIControlStateNormal];
    [changeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [changeButton setTitleEdgeInsets:UIEdgeInsetsMake(0, - changeButton.imageView.size.width, 0, changeButton.imageView.size.width)];
    [changeButton setImageEdgeInsets:UIEdgeInsetsMake(0, changeButton.titleLabel.bounds.size.width, 0, - changeButton.titleLabel.bounds.size.width)];
    [searchView addSubview:changeButton];
    UITextField *searchField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(changeButton.frame), 0, searchView.width - changeButton.width, 30)];
    [searchView addSubview:searchField];
    
    self.navigationItem.titleView = searchView;
    
}



@end
