//
//  MTHomePinpaiTitleView.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/27.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTHomePinpaiTitleView.h"

@interface MTHomePinpaiTitleView ()
@property (nonatomic ,strong)UIButton *titleButton;
@property (nonatomic ,strong)UIButton *moreButton;
@property (nonatomic ,strong)UIView *lineView;
@end

@implementation MTHomePinpaiTitleView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }return self;
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = LHSeperatorColor;
    }return _lineView;
}

- (UIButton *)titleButton
{
    if (!_titleButton) {
        _titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_titleButton setImage:[UIImage imageNamed:@"title_image"] forState:UIControlStateNormal];
        [_titleButton setTitle:@"品牌专区" forState:UIControlStateNormal];
        [_titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _titleButton.titleLabel.font = Font(13);
    }return _titleButton;
}

- (UIButton *)moreButton
{
    if (!_moreButton) {
        _moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_moreButton setTitle:@"更多 >>" forState:UIControlStateNormal];
        _moreButton.titleLabel.font = Font(13);
        [_moreButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }return _moreButton;
}

- (void)setupUI
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.titleButton];
    [self addSubview:self.moreButton];
    [self addSubview:self.lineView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat button_w = self.width / 4;
    CGFloat button_h = self.height;
    self.titleButton.frame = CGRectMake(0, 0, button_w, button_h);
    self.moreButton.frame = CGRectMake(self.width - button_w, 0, button_w, button_h);
    self.lineView.frame = CGRectMake(0, self.height - 1, self.width, 1);
    
}

@end
