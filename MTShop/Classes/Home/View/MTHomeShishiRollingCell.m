//
//  MTHomeShishiRollingCell.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/27.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTHomeShishiRollingCell.h"

@interface MTHomeShishiRollingCell ()
@property (nonatomic ,strong)UIImageView *iconImageView;
@property (nonatomic ,strong)UILabel *nameLabel;
@property (nonatomic ,strong)UILabel *levelLabel;
@property (nonatomic ,strong)UILabel *sizeLabel;
@property (nonatomic ,strong)UILabel *priceLabel;
@property (nonatomic ,strong)UILabel *gongQiuLabel;
@property (nonatomic ,strong)UILabel *vipLabel;
@end

@implementation MTHomeShishiRollingCell

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
        _iconImageView.backgroundColor = LHRandomColor;
    }return _iconImageView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = Font(18);
        _nameLabel.text = @"豪斯spf 3级";
    }return _nameLabel;
}

- (UILabel *)levelLabel
{
    if (!_levelLabel) {
        _levelLabel = [UILabel new];
        _levelLabel.font = Font(11);
        _levelLabel.textColor = [UIColor grayColor];
        _levelLabel.text = @"等级：AB级";
    }return _levelLabel;
}

- (UILabel *)sizeLabel
{
    if (!_sizeLabel) {
        _sizeLabel = [UILabel new];
        _sizeLabel.font = Font(11);
        _sizeLabel.textColor = [UIColor grayColor];
        _sizeLabel.text = @"规格：19*89/184*183/488 mm";
    }return _sizeLabel;
}

- (UILabel *)priceLabel
{
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.font = Font(11);
        _priceLabel.textColor = MTMainColor;
        _priceLabel.text = @"价格：¥998";
    }return _priceLabel;
}

- (UILabel *)gongQiuLabel
{
    if (!_gongQiuLabel) {
        _gongQiuLabel = [UILabel new];
        _gongQiuLabel.font = Font(11);
        _gongQiuLabel.textColor = MTMainColor;
        _gongQiuLabel.text = @"求购";
        _gongQiuLabel.layer.borderColor = MTMainColor.CGColor;
        _gongQiuLabel.layer.borderWidth = 1;
        _gongQiuLabel.textAlignment = NSTextAlignmentCenter;
    }return _gongQiuLabel;
}

- (UILabel *)vipLabel
{
    if (!_vipLabel) {
        _vipLabel = [UILabel new];
        _vipLabel.font = Font(11);
        _vipLabel.textColor = [UIColor whiteColor];
        _vipLabel.backgroundColor = LHColor(254, 210, 73);
        _vipLabel.textAlignment = NSTextAlignmentCenter;
        _vipLabel.text = @"vip";
    }return _vipLabel;
}

- (void)setupUI
{
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.levelLabel];
    [self.contentView addSubview:self.sizeLabel];
    [self.contentView addSubview:self.priceLabel];
    [self.contentView addSubview:self.gongQiuLabel];
    [self.contentView addSubview:self.vipLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 10;
    CGFloat image_h = self.height - padding *2;
    CGFloat image_w = image_h + padding *2;
    CGFloat tagLabel_w = (self.width - padding *4 - image_w) / 5.5;
    CGFloat tagLabel_h = (self.height - padding *4)/4;
    CGFloat middle_label_h = image_h / 3;
    CGFloat middle_label_w = tagLabel_w *3;
    self.iconImageView.frame = CGRectMake(padding, padding, image_w, image_h);
    self.nameLabel.frame = CGRectMake(CGRectGetMaxX(self.iconImageView.frame) + padding, padding, middle_label_w, middle_label_h);
    self.levelLabel.frame = CGRectMake(CGRectGetMinX(self.nameLabel.frame), CGRectGetMaxY(self.nameLabel.frame), middle_label_w / 2, middle_label_h);
    self.sizeLabel.frame = CGRectMake(CGRectGetMinX(self.levelLabel.frame), CGRectGetMaxY(self.levelLabel.frame), middle_label_w, middle_label_h);
    self.priceLabel.frame = CGRectMake(CGRectGetMaxX(self.levelLabel.frame) + padding, CGRectGetMaxY(self.nameLabel.frame), middle_label_w / 2, middle_label_h);
    self.gongQiuLabel.frame = CGRectMake(self.width - tagLabel_w - padding, padding, tagLabel_w, tagLabel_h);
    self.vipLabel.frame = CGRectMake(CGRectGetMinX(self.gongQiuLabel.frame), CGRectGetMaxY(self.gongQiuLabel.frame) + padding, tagLabel_w, tagLabel_h);
    
}

@end
