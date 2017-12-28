//
//  MTHomeTopView.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/26.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTHomeTopView.h"

@interface MTHomeTopView ()
@property (nonatomic ,strong)UIImageView *bgImageView;
@end

@implementation MTHomeTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self setupSubViews];
        
    }return self;
}

#pragma mark - setupSubViews
- (void)setupSubViews
{
    self.cityButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.cityButton setTitle:@"临沂市" forState:UIControlStateNormal];
    [self.cityButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.cityButton setImage:[UIImage imageNamed:@"home_city_more"] forState:UIControlStateNormal];
    self.cityButton.titleLabel.font = Font(14);
    self.cityButton.backgroundColor = LHClearColor;
    [self.cityButton addTarget:self action:@selector(cityButtonAction) forControlEvents:UIControlEventTouchUpInside];

    self.searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.searchButton setTitle:@"搜索" forState:UIControlStateNormal];
    [self.searchButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.searchButton setImage:[UIImage imageNamed:@"home_search"] forState:UIControlStateNormal];
    [self.searchButton addTarget:self action:@selector(searchButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.searchButton.titleLabel.font = Font(14);
    self.searchButton.backgroundColor = LHClearColor;
    
    self.qianDaoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.qianDaoButton setTitle:@"签到" forState:UIControlStateNormal];
    [self.qianDaoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.qianDaoButton.titleLabel.font = Font(14);
    self.qianDaoButton.backgroundColor = LHClearColor;
    [self.qianDaoButton addTarget:self action:@selector(qiandaoButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.bgImageView = [[UIImageView alloc]init];
    self.bgImageView.backgroundColor = [UIColor whiteColor];
  
    [self addSubview:self.bgImageView];
    [self addSubview:self.cityButton];
    [self addSubview:self.searchButton];
    [self addSubview:self.qianDaoButton];
}

#pragma mark - ButtonAction
- (void)cityButtonAction
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(topViewCityButtonClick:)]) {
        [self.delegate topViewCityButtonClick:self];
    }
}
- (void)searchButtonAction
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(topViewSearchButtonClick:)]) {
        [self.delegate topViewSearchButtonClick:self];
    }
}
- (void)qiandaoButtonAction
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(topViewQiandaoButtonClick:)]) {
        [self.delegate topViewQiandaoButtonClick:self];
    }
}


#pragma mark - layoutSubviews
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 10;
    CGFloat button_width = self.width / 4.5;
    CGFloat button_height = self.height - padding *2;
    CGFloat bgImage_height = self.height - 30;
    self.bgImageView.frame = CGRectMake(padding *2, padding *2, self.width - button_width, bgImage_height);
    self.bgImageView.layer.cornerRadius = 3.f;
    self.bgImageView.layer.masksToBounds = YES;
    self.cityButton.frame = CGRectMake(padding, padding + 5, button_width, button_height);
    [self.cityButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.cityButton.imageView.size.width, 0, self.cityButton.imageView.size.width)];
    [self.cityButton setImageEdgeInsets:UIEdgeInsetsMake(0, self.cityButton.titleLabel.bounds.size.width, 0, -self.cityButton.titleLabel.bounds.size.width)];
    self.searchButton.frame = CGRectMake(CGRectGetMaxX(self.cityButton.frame), padding + 5, self.width - button_width * 2 , button_height);
    self.qianDaoButton.frame = CGRectMake(CGRectGetMaxX(self.searchButton.frame), padding + 5, button_width, button_height);
}

@end
