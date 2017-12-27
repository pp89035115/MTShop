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

#import "MTHomeZujiCell.h"
#import "MTHomeBannerCell.h"
#import "MTHomePinPaiCell.h"
#import "MTHomeShishiCell.h"

#import "MTHomePinpaiTitleView.h"
#import "MTHomeShishiTitleView.h"
@interface MTHomeController ()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
MTHomeTopViewDelegate
>
@property (nonatomic ,strong)UICollectionView *collectionView;
@property (nonatomic ,strong)UICollectionViewFlowLayout *layout;
@property (nonatomic ,strong)MTHomeTopView *topView;
@property (nonatomic ,strong)MTQiandaoView *qiandaoView;
@property (nonatomic ,strong)ZJAnimationPopView *popView;
@property (nonatomic ,strong)NSArray *pinpais;
@end

/*cell*/
static NSString *const MTHomeZujiCellId = @"MTHomeZujiCell";
static NSString *const MTHomeBannerCellId = @"MTHomeBannerCell";
static NSString *const MTHomePinPaiCellId = @"MTHomePinPaiCell";
static NSString *const MTHomeShishiCellId = @"MTHomeShishiCell";

/*headView*/
static NSString *const MTHomePinPaiTitleViewId = @"MTHomePinPaiTitleView";
static NSString *const MTHomeShishiTitleViewId = @"MTHomeShishiTitleView";



@implementation MTHomeController

- (NSArray *)pinpais
{
    if (!_pinpais) {
        _pinpais = @[@{@"imageUrl":@"http://www.pinganshu.com/Skins/Default/Img/Common/logo.jpg"},
                     @{@"imageUrl":@"http://www.deleongc.com/Images/top_06.jpg"},
                     @{@"imageUrl":@"http://www.xxlzg.com/templets/zg/img/logo.png"},
                     @{@"imageUrl":@"http://www.zjbeilv.com/Template/images/logo.jpg"}];
    }return _pinpais;
}


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
    [self registerCollectionViewCell];
    [self.view addSubview:self.collectionView];
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

#pragma mark - setupCollectionView

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, self.topView.height, gScreenWidth, gScreenHeight - self.topView.height) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = LHSeperatorColor;
    }return _collectionView;
}

#pragma mark - registerCollectionViewCell
- (void)registerCollectionViewCell
{
    [self.collectionView registerClass:[MTHomeZujiCell class] forCellWithReuseIdentifier:MTHomeZujiCellId];
    [self.collectionView registerClass:[MTHomeBannerCell class] forCellWithReuseIdentifier:MTHomeBannerCellId];
    [self.collectionView registerClass:[MTHomePinPaiCell class] forCellWithReuseIdentifier:MTHomePinPaiCellId];
    [self.collectionView registerClass:[MTHomeShishiCell class] forCellWithReuseIdentifier:MTHomeShishiCellId];

    
    [self.collectionView registerClass:[MTHomePinpaiTitleView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MTHomePinPaiTitleViewId];
    [self.collectionView registerClass:[MTHomeShishiTitleView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MTHomeShishiTitleViewId];
}

#pragma mark - <UICollectionViewDelegate,UICollectionViewDataSource>
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 7;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0 || section == 1 || section == 3) {
        return 1;
    }else if (section == 2)
    {
        return 4;
    }
    else
    {
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *tempCell = nil;
    if (indexPath.section == 0) {
        MTHomeZujiCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MTHomeZujiCellId forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        tempCell = cell;
    }else if (indexPath.section == 1)
    {
        MTHomeBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MTHomeBannerCellId forIndexPath:indexPath];
        cell.backgroundColor = LHClearColor;
        tempCell = cell;
    }else if (indexPath.section == 2)
    {
        MTHomePinPaiCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MTHomePinPaiCellId forIndexPath:indexPath];
        tempCell = cell;
    }else if (indexPath.section == 3)
    {
        MTHomeShishiCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MTHomeShishiCellId forIndexPath:indexPath];
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
        if (indexPath.section == 2) {
            MTHomePinpaiTitleView *pinpaiTitleView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MTHomePinPaiTitleViewId forIndexPath:indexPath];
            reusableview = pinpaiTitleView;
        }else if (indexPath.section == 3)
        {
            MTHomeShishiTitleView *pinpaiTitleView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MTHomeShishiTitleViewId forIndexPath:indexPath];
            reusableview = pinpaiTitleView;
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
    
    if (section == 2 || section == 3) {
        return CGSizeMake(gScreenWidth, 40);
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
    return 0;
}
#pragma mark - Y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}




@end
