//
//  MTMineController.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/15.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTMineController.h"
#import "MTMineView.h"

@interface MTMineController ()
<
UITableViewDataSource,
UITableViewDelegate,
UICollectionViewDelegate,
UICollectionViewDataSource
>
@property (nonatomic ,strong)UITableView *tableView;
@property (nonatomic ,strong)MTMineView *headView;
@property (nonatomic ,strong)UICollectionView *collectionView;
@end

//headView
static NSString *const MTMineViewId = @"MTMineView";


@implementation MTMineController

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
    [self setupSubviews];
}
#pragma mark - setupSubviews
- (void)setupSubviews
{
    [self.view addSubview:self.tableView];
}
#pragma mark - setupHeadView
- (MTMineView *)headView
{
    if (!_headView) {
        _headView = [[MTMineView alloc]initWithFrame:CGRectMake(0, 0, gScreenWidth, gScreenHeight / 2.5)];
        _headView.backgroundColor = MTMainColor ;
    }return _headView;
}

#pragma mark - setupCollectionView

#pragma mark - SetupCollectionView

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, gScreenWidth, gScreenHeight) collectionViewLayout:[UICollectionViewFlowLayout new]];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
        _collectionView.userInteractionEnabled = YES;

    }return _collectionView;
}

- (void)setupCollectionView
{
        [self.collectionView registerClass:[MTMineView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MTMineViewId];
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifierForBaseCell];
}

#pragma mark - <UICollectionViewDelegate,UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(0,0);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = LHRandomColor;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(gScreenWidth / 3, gScreenHeight / 5);
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}





@end
