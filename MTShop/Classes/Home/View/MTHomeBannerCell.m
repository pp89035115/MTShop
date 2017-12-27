//
//  MTHomeBannerCell.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/27.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTHomeBannerCell.h"
#import "SDCycleScrollView.h"
@interface MTHomeBannerCell ()
<
    SDCycleScrollViewDelegate
>
@property (nonatomic ,strong)SDCycleScrollView *bannerView;
@end

@implementation MTHomeBannerCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }return self;
}

- (SDCycleScrollView *)bannerView
{
    if (!_bannerView) {
        _bannerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero imageNamesGroup:nil];
        _bannerView.delegate = self;
        _bannerView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    }return _bannerView;
}

- (void)setupUI
{
    [self.contentView addSubview:self.bannerView];
    
    self.bannerView.imageURLStringsGroup = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514356099934&di=3496f390a4d2b5df8ba0877fece0f4bd&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimgad%2Fpic%2Fitem%2F91529822720e0cf319e713df0046f21fbe09aa86.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514356099934&di=366162b8d129133d31b9910d85488242&imgtype=0&src=http%3A%2F%2Fimgsrc.baidu.com%2Fimage%2Fc0%253Dshijue1%252C0%252C0%252C294%252C40%2Fsign%3Dd1234449b919ebc4d4757edaea4fa589%2Fb64543a98226cffcb605c49eb3014a90f603eaeb.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514356099933&di=051242e9e09e24ed48c0670681234757&imgtype=0&src=http%3A%2F%2Fcbu01.alicdn.com%2Fimg%2Fibank%2F2015%2F778%2F663%2F2018366877_1822705878.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1514356187669&di=6b2c3c7ce46c23ad73c3290ab710fbb4&imgtype=0&src=http%3A%2F%2Fimg006.hc360.cn%2Fm7%2FM06%2F70%2F84%2FwKhQo1Vj6uKEL29kAAAAADHe4JI489.jpg"];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.bannerView.frame = CGRectMake(0, 0, self.width, self.height);
}

@end
