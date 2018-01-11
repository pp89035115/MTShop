//
//  MTRegisterController.m
//  MTShop
//
//  Created by DQ_Yang on 2018/1/8.
//  Copyright © 2018年 MT. All rights reserved.
//

#import "MTRegisterController.h"

@interface MTRegisterController ()
@property (nonatomic ,strong)UITextField *phoneText;
@property (nonatomic ,strong)UITextField *passwordText;
@property (nonatomic ,strong)UITextField *idCode;
@end

@implementation MTRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubviews];
}

- (void)setupSubviews
{
    [self.navigationItem setTitle:@"登录"];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    CGFloat padding = 10;
    CGFloat text_w = gScreenWidth - padding *2;
    CGFloat text_h = gScreenHeight / 10;
    
    UITextField *phoneText = [[UITextField alloc]initWithFrame:CGRectMake(padding, padding *2 + kScreenTopStatusNaviHeight, text_w, text_h)];
    phoneText.backgroundColor = LHSeperatorColor;
    UIImageView *phoneLeftView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    phoneLeftView.image = [UIImage imageNamed:@"phone_image"];
    phoneText.leftView = phoneLeftView;
    phoneText.placeholder = @"手机号";
    phoneText.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:phoneText];
    self.phoneText = phoneText;
    
    UITextField *passwordText = [[UITextField alloc]initWithFrame:CGRectMake(padding, CGRectGetMaxY(phoneText.frame) + padding, text_w, text_h)];
    passwordText.backgroundColor = LHSeperatorColor;
    UIImageView *passwordLeftView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    passwordLeftView.image = [UIImage imageNamed:@"password"];
    passwordText.leftView = passwordLeftView;
    passwordText.leftViewMode = UITextFieldViewModeAlways;
    passwordText.placeholder = @"密码";
    [self.view addSubview:passwordText];
    self.passwordText = passwordText;
}

@end
