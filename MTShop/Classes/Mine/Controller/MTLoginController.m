//
//  MTLoginController.m
//  MTShop
//
//  Created by DQ_Yang on 2018/1/8.
//  Copyright © 2018年 MT. All rights reserved.
//

#import "MTLoginController.h"

@interface MTLoginController ()
@property (nonatomic ,strong)UITextField *nameText;
@property (nonatomic ,strong)UITextField *passwordText;
@end

@implementation MTLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
}

- (void)setupSubViews
{
    CGFloat padding = 10;
    CGFloat text_w = gScreenWidth - padding *2;
    CGFloat text_h = gScreenHeight / 10;
    
    UITextField *nameText = [[UITextField alloc]initWithFrame:CGRectMake(padding, padding *2, text_w, text_h)];
    [self.view addSubview:nameText];
    self.nameText = nameText;

    UITextField *passwordText = [[UITextField alloc]initWithFrame:CGRectMake(padding, padding *2, text_w, text_h)];
    [self.view addSubview:passwordText];
    self.passwordText = passwordText;
}



@end