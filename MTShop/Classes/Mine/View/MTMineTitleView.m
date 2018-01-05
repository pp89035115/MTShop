//
//  MTMineTitleView.m
//  MTShop
//
//  Created by DQ_Yang on 2018/1/5.
//  Copyright © 2018年 MT. All rights reserved.
//

#import "MTMineTitleView.h"

@interface MTMineTitleView ()
@property (nonatomic ,strong)UILabel *titleLabel;
@property (nonatomic ,strong)UIView *lineView;
@end

@implementation MTMineTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }return self;
}

- (void)setupUI
{
    [self setBackgroundColor:[UIColor whiteColor]];
    [self addSubview:self.titleLabel];
    [self addSubview:self.lineView];
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
    }return _titleLabel;
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = LHSeperatorColor;
    }return _lineView;
}

- (void)setTitleStr:(NSString *)titleStr
{
    _titleStr = titleStr;
    self.titleLabel.text = titleStr;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 10;
    self.titleLabel.frame = CGRectMake(padding, padding, self.width - padding *2, self.height - padding *2);
    self.lineView.frame = CGRectMake(0, self.height - 1, self.width, .5);
}

@end
