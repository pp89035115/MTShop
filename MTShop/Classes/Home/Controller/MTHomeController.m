//
//  MTHomeController.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/15.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTHomeController.h"
#import "MTHomeTopView.h"
#import "MTCityListController.h"
#import "ZJAnimationPopView.h"
#import "MTQiandaoView.h"

@interface MTHomeController ()
<
UITableViewDelegate,
UITableViewDataSource,
MTHomeTopViewDelegate
>
@property (nonatomic ,strong)UITableView *tableView;
@property (nonatomic ,strong)MTHomeTopView *topView;
@property (nonatomic ,strong)MTQiandaoView *qiandaoView;
@property (nonatomic ,strong)ZJAnimationPopView *popView;
@end

@implementation MTHomeController


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
}

#pragma mark - setupSubViews
- (void)setupSubViews
{
    [self setupNavigation];
    [self.view addSubview:self.tableView];
}

#pragma mark - setupNavigation

- (MTHomeTopView *)topView
{
    if (!_topView) {
        _topView = [[MTHomeTopView alloc]initWithFrame:CGRectMake(0, 0, gScreenWidth, 64)];
        _topView.backgroundColor = MTMainColor;
        _topView.delegate = self;
    }return _topView;
}

- (void)setupNavigation
{
    [self.view addSubview:self.topView];
}

#pragma mark - <MTHomeTopViewDelegate>
- (void)topViewCityButtonClick:(MTHomeTopView *)topView
{
    LHFUNCTION
}
- (void)topViewSearchButtonClick:(MTHomeTopView *)topView
{
    LHFUNCTION
}
- (void)topViewQiandaoButtonClick:(MTHomeTopView *)topView
{
    LHFUNCTION
    [self showQiandaoCard];
}

#pragma mark - setupQianDaoView

- (MTQiandaoView *)qiandaoView
{
    if (!_qiandaoView) {
        _qiandaoView = [[MTQiandaoView alloc]initWithFrame:CGRectMake(0, 0, gScreenWidth / 1.5, gScreenHeight / 2)];
        _qiandaoView.backgroundColor = LHSeperatorColor;
        _qiandaoView.layer.cornerRadius = 5.0f;
    }return _qiandaoView;
}

- (void)showQiandaoCard
{
    ZJAnimationPopView *popView = [[ZJAnimationPopView alloc] initWithCustomView:self.qiandaoView popStyle:3 dismissStyle:3];
    popView.isClickBGDismiss = YES;
    popView.popBGAlpha = 0.5f;
    popView.isObserverOrientationChange = YES;
    popView.popComplete = ^{
        NSLog(@"显示完成");
    };
    popView.dismissComplete = ^{
        NSLog(@"移除完成");
    };
    [self handleCustomActionEnvent:popView];
    [popView pop];
    self.popView = popView;
}

#pragma mark - qiandaoView回调方法
- (void)handleCustomActionEnvent:(ZJAnimationPopView *)popView
{
    self.qiandaoView.qiandaoButtonActionBlock = ^(MTQiandaoView *qiandaoView) {
        [popView dismiss];
    };
    self.qiandaoView.qiandaoGuizeActionBlock = ^(MTQiandaoView *qiandaoView) {
        [popView dismiss];
    };
}

#pragma mark - setupTableView
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topView.frame), gScreenWidth, gScreenHeight - 100) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator= NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        [_tableView setSeparatorColor: LHColor(229, 230, 231)];
        _tableView.tableFooterView = [[UIView alloc]init];
    }return _tableView;
}


#pragma mark - <UITableViewDelegate,UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return gScreenHeight / 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 10)];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MTBaseTableViewCell *cell = [MTBaseTableViewCell cellWithTableView:tableView];
    cell.backgroundColor = LHRandomColor;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self.navigationController pushViewController:[[MTCityListController alloc]init] animated:YES];
}



@end
