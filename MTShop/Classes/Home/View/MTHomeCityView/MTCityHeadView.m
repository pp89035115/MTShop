//
//  MTCityHeadView.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/28.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTCityHeadView.h"

@interface MTCityHeadView ()
@end

@implementation MTCityHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }return self;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = Font(13);
        _titleLabel.textColor = [UIColor blackColor];
    }return _titleLabel;
}

- (void)setupUI{
    self.contentView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.6];
    [self.contentView addSubview:self.titleLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleLabel.frame =  CGRectMake(0, 0, self.width, self.height);
}

@end
