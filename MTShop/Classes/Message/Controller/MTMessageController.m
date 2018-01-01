//
//  MTMessageController.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/15.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTMessageController.h"

@interface MTMessageController ()
<
    UITableViewDelegate,
    UITableViewDataSource
>
@property (nonatomic ,strong)UITableView *tableView;
@property (nonatomic ,strong)NSArray *dataSource;
@end

@implementation MTMessageController

- (NSArray *)dataSource
{
    if (!_dataSource) {
        _dataSource = @[@{@"image":@"",
                          @"name":@"长期销售"},
                        @{@"image":@"",
                          @"name":@"长期采购"},
                        @{@"image":@"",
                          @"name":@"实时销售"},
                        @{@"image":@"",
                          @"name":@"实时采购"},
                        @{@"image":@"",
                          @"name":@"通知"},
                        ];
    }return _dataSource;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self setupSubViews];
}

- (void)setupSubViews
{
    [self.view setBackgroundColor:LHSeperatorColor];
    [self.view addSubview:self.tableView];
}

#pragma mark - setupTableView

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, gScreenWidth, gScreenHeight) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator= NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.tableFooterView = [[UIView alloc]init];
    }return _tableView;
}


#pragma mark - <UITableViewDelegate,UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return gScreenHeight / 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"BaseViewCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.imageView.image = [UIImage imageNamed:self.dataSource[indexPath.section][@"image"]];
    cell.textLabel.text = self.dataSource[indexPath.section][@"name"];
    return cell;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)])
    {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
