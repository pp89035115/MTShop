//
//  MTLoginController.m
//  MTShop
//
//  Created by DQ_Yang on 2018/1/8.
//  Copyright © 2018年 MT. All rights reserved.
//

#import "MTLoginController.h"
#import "MTRegisterController.h"

@interface MTLoginController ()
<
UITextFieldDelegate
>
@property (nonatomic ,strong)UITextField *nameText;
@property (nonatomic ,strong)UITextField *passwordText;
@property (nonatomic ,strong)UIButton *loginButton;
@property (nonatomic ,strong)UIButton *forgetButton;
@end

@implementation MTLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
}

- (void)setupSubViews
{
    
    [self.navigationItem setTitle:@"登录"];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    CGFloat padding = 10;
    CGFloat text_w = gScreenWidth - padding *2;
    CGFloat text_h = gScreenHeight / 10;
    
    UITextField *nameText = [[UITextField alloc]initWithFrame:CGRectMake(padding, padding *2 + kScreenTopStatusNaviHeight, text_w, text_h)];
    nameText.backgroundColor = LHSeperatorColor;
    UIImageView *nameLeftView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    nameLeftView.image = [UIImage imageNamed:@"phone_image"];
    nameText.leftView = nameLeftView;
    nameText.placeholder = @"手机号";
    nameText.leftViewMode = UITextFieldViewModeAlways;
    [self.view addSubview:nameText];
    self.nameText = nameText;

    UITextField *passwordText = [[UITextField alloc]initWithFrame:CGRectMake(padding, CGRectGetMaxY(nameText.frame) + padding, text_w, text_h)];
    passwordText.backgroundColor = LHSeperatorColor;
    UIImageView *passwordLeftView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    passwordLeftView.image = [UIImage imageNamed:@"password"];
    passwordText.leftView = passwordLeftView;
    passwordText.leftViewMode = UITextFieldViewModeAlways;
    passwordText.placeholder = @"密码";
    [self.view addSubview:passwordText];
    self.passwordText = passwordText;
    
    CGFloat button_w = gScreenWidth / 1.5;
    CGFloat button_h = gScreenWidth / 6.5;
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setBackgroundColor:MTMainColor];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    loginButton.frame = CGRectMake(gScreenWidth / 2 - button_w / 2, CGRectGetMaxY(passwordText.frame) + padding * 2, button_w, button_h);
    loginButton.layer.cornerRadius = button_h / 2;
    [self.view addSubview:loginButton];
    self.loginButton = loginButton;
    
    UIButton *forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetButton.frame = CGRectMake(gScreenWidth / 2 - button_w / 2, CGRectGetMaxY(loginButton.frame), button_w, button_h);
    [forgetButton addTarget:self action:@selector(forgetAction) forControlEvents:UIControlEventTouchUpInside];
//    [forgetButton setBackgroundColor:MTMainColor];
    [forgetButton setTitle:@"忘记密码" forState:UIControlStateNormal];
    forgetButton.titleLabel.font = Font(13);
    [forgetButton setTitleColor:MTMainColor forState:UIControlStateNormal];
    [self.view addSubview:forgetButton];
    self.forgetButton = forgetButton;
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(registerAction)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
}

- (void)loginAction
{
    LHFUNCTION
}

- (void)forgetAction
{
    LHFUNCTION
}

- (void)registerAction
{
    LHFUNCTION
    MTRegisterController *regiseterVc = [[MTRegisterController alloc]init];
    regiseterVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:regiseterVc animated:YES];
}


@end
