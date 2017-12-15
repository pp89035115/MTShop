//
//  MTHomeController.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/15.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTHomeController.h"

@interface MTHomeController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic ,strong)UITableView *tableView;
@end

@implementation MTHomeController



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubViews];
}

#pragma mark - setupSubViews
- (void)setupSubViews
{
    [self.view addSubview:self.tableView];
}


- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, gScreenWidth, gScreenHeight) style:UITableViewStylePlain];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return gScreenHeight / 10;
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
}



@end
