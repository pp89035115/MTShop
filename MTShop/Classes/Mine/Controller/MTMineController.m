//
//  MTMineController.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/15.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTMineController.h"
#import "MTMineView.h"
#import "MTMineTopMenuCell.h"
#import "MTMineTitleView.h"
#import "MTMineItemCell.h"

#import "MTDingYueBaseController.h"

@interface MTMineController ()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
MTMineViewDelegate
>
@property (nonatomic ,strong)UICollectionView *collectionView;
@property (nonatomic ,strong)NSArray *menuSource;
@property (nonatomic ,strong)NSArray *itemSource;
@end

//headView
static NSString *const MTMineViewId = @"MTMineViewId";
static NSString *const MTMineTitleViewId = @"MTMineTitleViewId";

//cell
static NSString *const MTMineTopMenuCellId = @"MTMineTopMenuCellId";
static NSString *const MTMineItemCellId = @"MTMineItemCellId";

@implementation MTMineController

- (NSArray *)menuSource
{
    if (!_menuSource) {
        _menuSource = @[@{@"image":@"mine_dingyue",@"name":@"我的订阅"},
                        @{@"image":@"mine_shoucang",@"name":@"我的收藏"},
                        @{@"image":@"mine_fabu",@"name":@"我的发布"},
                        @{@"image":@"mine_qiandao",@"name":@"我要签到"}];
    }return _menuSource;
}
- (NSArray *)itemSource
{
    if (!_itemSource) {
        _itemSource = @[@{@"image":@"mine_mucaibi",@"name":@"木材币"},
                        @{@"image":@"mine_fankui",@"name":@"我要反馈"},
                        @{@"image":@"mine_pinpai",@"name":@"我的品牌"},
                        @{@"image":@"mine_mucaiquan",@"name":@"木材圈"},
                        @{@"image":@"mine_liulan",@"name":@"浏览历史"},
                        @{@"image":@"mine_guanyu",@"name":@"关于我们"}];
    }return _itemSource;
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
    [self setupSubviews];
}
#pragma mark - setupSubviews
- (void)setupSubviews
{
    [self registerCollectionViewCell];
    [self.view addSubview:self.collectionView];
}

#pragma mark - setupCollectionView

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, -20, gScreenWidth, gScreenHeight) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = LHSeperatorColor;
    }return _collectionView;
}

#pragma mark - registerCollectionViewCell
- (void)registerCollectionViewCell
{
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.collectionView registerClass:[MTMineTopMenuCell class] forCellWithReuseIdentifier:MTMineTopMenuCellId];
    [self.collectionView registerClass:[MTMineItemCell class] forCellWithReuseIdentifier:MTMineItemCellId];

    
    [self.collectionView registerClass:[MTMineView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MTMineViewId];
    [self.collectionView registerClass:[MTMineTitleView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MTMineTitleViewId];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"footerViewId"];
}

#pragma mark - <MTMineViewDelegate>
- (void)mt_mineViewAvatarClick:(MTMineView *)mineView
{
    LHFUNCTION
}

- (void)mt_mineViewSettingClick:(MTMineView *)mineView
{
    LHFUNCTION
}


#pragma mark - <UICollectionViewDelegate,UICollectionViewDataSource>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        if (indexPath.item == 0)//我的订阅
        {
            MTDingYueBaseController *dingyueBaseVc = [[MTDingYueBaseController alloc]init];
            dingyueBaseVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:dingyueBaseVc animated:YES];
            
        }else if (indexPath.item == 1)//我的收藏
        {
            
        }else if (indexPath.item == 2)//我的发布
        {
            
        }else if (indexPath.item == 3)//我要签到
        {
            
        }
    }else if (indexPath.section == 1)
    {
        
    }
}


- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return self.menuSource.count;
    }else if (section == 1)
    {
        return self.itemSource.count;
    }
    {
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *tempCell = nil;
    if (indexPath.section == 0)//   足迹
    {
        MTMineTopMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MTMineTopMenuCellId forIndexPath:indexPath];
        cell.source = self.menuSource[indexPath.item];
        tempCell = cell;
    }else if (indexPath.section == 1)
    {
        MTMineItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MTMineItemCellId forIndexPath:indexPath];
        cell.itemSource = self.itemSource[indexPath.item];
        tempCell = cell;
    }
    else
    {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
        cell.backgroundColor = LHRandomColor;
        tempCell = cell;
    }
    return tempCell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        if (indexPath.section == 0) {
            MTMineView *mineView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MTMineViewId forIndexPath:indexPath];
            mineView.delegate = self;
            mineView.backgroundColor = MTMainColor;
            reusableview = mineView;
        }else if (indexPath.section == 1)
        {
            MTMineTitleView *titleView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:MTMineTitleViewId forIndexPath:indexPath];
            titleView.titleStr = @"个人服务";
            reusableview = titleView;
        }
        else
        {
            
        }
    }
    if (kind == UICollectionElementKindSectionFooter) {
         UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"footerViewId" forIndexPath:indexPath];
        reusableview = footerView;
    }
    
    return reusableview;
}

#pragma mark - item宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
        return CGSizeMake(gScreenWidth / 4 , gScreenWidth / 4);

    }else if (indexPath.section == 1)
    {
        return CGSizeMake(gScreenWidth / 2 - .5, gScreenWidth / 6);

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
        return CGSizeMake(gScreenWidth, gScreenHeight / 3);
    }else if (section == 1)
    {
        return CGSizeMake(gScreenWidth, gScreenWidth / 7);
    }
    
    return CGSizeZero;
}

#pragma mark - foot宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(gScreenWidth, 10);
    }
    return CGSizeZero;
}

#pragma mark - <UICollectionViewDelegateFlowLayout>
#pragma mark - X间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return 0;
    }else if (section ==1)
    {
        return .5;
    }
    return 0;
}
#pragma mark - Y间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    if (section == 0) {
        return 2;
    }else if (section == 1)
    {
        return .5;
    }
    return 0;
}








@end
