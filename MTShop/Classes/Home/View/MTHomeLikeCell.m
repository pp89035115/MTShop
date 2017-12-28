//
//  MTHomeLikeCell.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/27.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTHomeLikeCell.h"

@interface MTHomeLikeCell ()
@property (nonatomic ,strong)UIImageView *iconImageView;
@property (nonatomic ,strong)UILabel *nameLabel;
@property (nonatomic ,strong)UILabel *locationLabel;
@property (nonatomic ,strong)UILabel *sizeLabel;
@property (nonatomic ,strong)UILabel *priceLabel;
@property (nonatomic ,strong)UILabel *levelLabel;
@end

@implementation MTHomeLikeCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }return self;
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
        _iconImageView.backgroundColor = LHSeperatorColor;
    }return _iconImageView;
}
- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = Font(16);
        _nameLabel.text = @"加松SPF（巴槟）";
        _nameLabel.textColor = [UIColor grayColor];
    }return _nameLabel;
}

- (UILabel *)locationLabel
{
    if (!_locationLabel) {
        _locationLabel = [UILabel new];
        _locationLabel.font = Font(10);
        _locationLabel.text = @"临沂";
    }return _locationLabel;
}


- (UILabel *)sizeLabel
{
    if (!_sizeLabel) {
        _sizeLabel = [UILabel new];
        _sizeLabel.font = Font(12);
        _sizeLabel.textColor = [UIColor grayColor];
        _sizeLabel.text = @"规格：38*140*2400mm";
    }return _sizeLabel;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = Font(12);
        _priceLabel.textColor = MTMainColor;
        _priceLabel.text = @"¥888";
    }return _priceLabel;
}

- (UILabel *)levelLabel
{
    if (!_levelLabel) {
        _levelLabel = [UILabel new];
        _levelLabel.font = Font(12);
        _levelLabel.textColor = [UIColor grayColor];
        _levelLabel.text = @"环保等级：一级";
    }return _levelLabel;
}


- (void)setupUI{
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.locationLabel];
    [self.contentView addSubview:self.sizeLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.levelLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 10;
    CGFloat image_size = self.width - padding *8;
    CGFloat label_w = self.width / 3 * 2;
    CGFloat label_h = (self.height - image_size - padding *2) / 3;
    
    self.iconImageView.frame = CGRectMake(padding *4, padding, image_size, image_size);
    self.nameLabel.frame = CGRectMake(padding, CGRectGetMaxY(self.iconImageView.frame), label_w, label_h);
    self.locationLabel.frame = CGRectMake(CGRectGetMaxX(self.nameLabel.frame), CGRectGetMinY(self.nameLabel.frame), padding *4, padding *2);
    self.locationLabel.centerY = self.nameLabel.centerY;
    self.sizeLabel.frame = CGRectMake(padding, CGRectGetMaxY(self.nameLabel.frame), label_w, label_h);
    self.priceLabel.frame = CGRectMake(padding, CGRectGetMaxY(self.sizeLabel.frame), self.width / 3, label_h);
    self.levelLabel.frame = CGRectMake((CGRectGetMaxX(self.priceLabel.frame)), CGRectGetMaxY(self.sizeLabel.frame), label_w, label_h);
}

@end
