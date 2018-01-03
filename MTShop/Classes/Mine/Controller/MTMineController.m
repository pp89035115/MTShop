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
UICollectionViewDelegate,
UICollectionViewDataSource
>
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
    [self.view addSubview:self.collectionView];
    [self registerCollectionViewCell];
}

#pragma mark - setupCollectionView

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, gScreenWidth, gScreenHeight) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = LHSeperatorColor;
    }return _collectionView;
}

#pragma mark - registerCollectionViewCell
- (void)registerCollectionViewCell
{
//    [self.collectionView registerClass:[MTHomeZujiCell class] forCellWithReuseIdentifier:MTHomeZujiCellId];
   
    [self.collectionView registerClass:[MTMineView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MTMineViewId];
}

#pragma mark - <UICollectionViewDelegate,UICollectionViewDataSource>
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 7;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    {
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *tempCell = nil;
    if (indexPath.section == 0)//   足迹
    {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        tempCell = cell;
    }
    else
    {
        
    }
    return tempCell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        if (indexPath.section == 0) {
            MTMineView *mineView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MTMineViewId forIndexPath:indexPath];
            reusableview = mineView;
        }
        else
        {
            
        }
    }
    if (kind == UICollectionElementKindSectionFooter) {
        
    }
    
    return reusableview;
}

#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CGSizeMake(gScreenWidth, 30);
    }else if (indexPath.section == 1)
    {
        return CGSizeMake(gScreenWidth, gScreenWidth / 2);
    }else if (indexPath.section == 2)
    {
        return CGSizeMake((gScreenWidth - 5) / 4, gScreenWidth / 6);
    }else if (indexPath.section == 3)
    {
        return CGSizeMake(gScreenWidth, gScreenWidth / 4);
    }else if (indexPath.section == 4)
    {
        return CGSizeMake(gScreenWidth, gScreenWidth / 4);
    }else if (indexPath.section == 5)
    {
        return CGSizeMake((gScreenWidth - 4) / 2,(gScreenWidth - 4) / 2 + 40);
    }
    return CGSizeZero;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    if (indexPath.section == 4) {
        
    }
    return layoutAttributes;
}

#pragma mark - head宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return CGSizeMake(gScreenWidth, gScreenHeight / 2.5);
    }
    
    return CGSizeZero;
}

#pragma mark - foot宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    
    return CGSizeZero;
}

#pragma mark - <UICollectionViewDelegateFlowLayout>
#pragma mark - X间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 5) {
        return 4;
    }
    return 0;
}
#pragma mark - Y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 4) {
        return 2;
    }else if (section == 5)
    {
        return 4;
    }
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}






@end
