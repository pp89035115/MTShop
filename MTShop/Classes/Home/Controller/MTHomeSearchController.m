//
//  MTHomeSearchController.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/28.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTHomeSearchController.h"
#import "JMDropMenu.h"

@interface MTHomeSearchController ()
<JMDropMenuDelegate>
@property (nonatomic ,strong)UIButton *button;
@property (nonatomic ,copy)NSString *buttonTag;
@end

@implementation MTHomeSearchController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self setupSrarchBar];
}


- (void)setupSrarchBar
{
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
    [changeButton addTarget:self action:@selector(changeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [searchView addSubview:changeButton];
    self.button = changeButton;
    UITextField *searchField = [[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(changeButton.frame), 0, searchView.width - changeButton.width, 30)];
    [searchView addSubview:searchField];
    
    self.navigationItem.titleView = searchView;
}

- (void)changeButtonClick:(UIButton *)button
{
    [JMDropMenu showDropMenuFrame:CGRectMake(CGRectGetMaxX(button.frame), CGRectGetMaxY(button.frame) + 15, 55, 85) ArrowOffset:102.f TitleArr:@[@"实时",@"长期"] ImageArr:@[@"",@""] Type:JMDropMenuTypeWeChat LayoutType:JMDropMenuLayoutTypeTitle RowHeight:40.f Delegate:self];
}

#pragma mark - JMDropMenuDelegate
- (void)didSelectRowAtIndex:(NSInteger)index Title:(NSString *)title Image:(NSString *)image
{
    NSLog(@"++++ title : %@ ",title);
    [self.button setTitle:title forState:UIControlStateNormal];
    self.buttonTag = title;
    
}





@end
