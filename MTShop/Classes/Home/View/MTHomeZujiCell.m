//
//  MTHomeZujiCell.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/27.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTHomeZujiCell.h"

@interface MTHomeZujiCell ()
@property (nonatomic ,strong)UIButton *zujiButton;
@property (nonatomic ,strong)UILabel *zujiLabel;
@end


@implementation MTHomeZujiCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }return self;
}

- (UIButton *)zujiButton
{
    if (!_zujiButton) {
        _zujiButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_zujiButton setImage:[UIImage imageNamed:@"home_city_more"] forState:UIControlStateNormal];
        [_zujiButton setTitle:@"足迹" forState:UIControlStateNormal];
        [_zujiButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _zujiButton.titleLabel.font = Font(13);
    }return _zujiButton;
}

- (UILabel *)zujiLabel
{
    if (!_zujiLabel) {
        _zujiLabel = [[UILabel alloc]init];
        _zujiLabel.font = Font(13);
    }return _zujiLabel;
}

- (void)setupUI
{
    [self.contentView addSubview:self.zujiButton];
    [self.contentView addSubview:self.zujiLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat button_w = self.width / 6;
    CGFloat button_h = self.height;
    self.zujiButton.frame = CGRectMake(0, 0, button_w, button_h);
    [self.zujiButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.zujiButton.imageView.size.width, 0, self.zujiButton.imageView.size.width)];
    [self.zujiButton setImageEdgeInsets:UIEdgeInsetsMake(0, self.zujiButton.titleLabel.bounds.size.width, 0, -self.zujiButton.titleLabel.bounds.size.width)];
    self.zujiLabel.frame = CGRectMake(CGRectGetMaxX(self.zujiButton.frame), 0, self.width - button_w, button_h);
}

@end
