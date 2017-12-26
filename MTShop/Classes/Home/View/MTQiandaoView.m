//
//  MTQiandaoView.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/26.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTQiandaoView.h"

@interface MTQiandaoView ()
@property (nonatomic ,strong)UILabel *titleLabel;
@property (nonatomic ,strong)UIButton *qiandaoButton;
@property (nonatomic ,strong)UILabel *childLabel;
@property (nonatomic ,strong)UIButton *qiandaoGuizeButton;
@property (nonatomic ,strong)UILabel *qiandaoTitleLabel;
@property (nonatomic ,strong)UILabel *mucaibiTitleLabel;
@property (nonatomic ,strong)UILabel *qiandaoLabel;
@property (nonatomic ,strong)UILabel *mucaibiLabel;

@end

@implementation MTQiandaoView

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = Font(15);
        _titleLabel.text = @"每日签到获得木材币";
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = LHClearColor;
    }return _titleLabel;
}

- (UIButton *)qiandaoButton
{
    if (!_qiandaoButton) {
        _qiandaoButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _qiandaoButton.backgroundColor = MTMainColor;
        [_qiandaoButton setTitle:@"签到" forState:UIControlStateNormal];
        [_qiandaoButton addTarget:self action:@selector(qiandaoAction) forControlEvents:UIControlEventTouchUpInside];
    }return _qiandaoButton;
}
- (UILabel *)childLabel
{
    if (!_childLabel) {
        _childLabel = [[UILabel alloc]init];
        _childLabel.text = @"在“我的”页面查看木材币";
        _childLabel.textAlignment = NSTextAlignmentCenter;
        _childLabel.font = Font(14);
    }return _childLabel;
}
- (UIButton *)qiandaoGuizeButton
{
    if (!_qiandaoGuizeButton) {
        _qiandaoGuizeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _qiandaoGuizeButton.titleLabel.font = Font(14);
        [_qiandaoGuizeButton setTitle:@"签到规则" forState:UIControlStateNormal];
        [_qiandaoGuizeButton setTitleColor:MTMainColor forState:UIControlStateNormal];
        [_qiandaoGuizeButton addTarget:self action:@selector(qiandaoguizeAction) forControlEvents:UIControlEventTouchUpInside];

    }return _qiandaoGuizeButton;
}

- (UILabel *)qiandaoTitleLabel
{
    if (!_qiandaoTitleLabel) {
        _qiandaoTitleLabel = [[UILabel alloc]init];
        _qiandaoTitleLabel.font = Font(12);
        _qiandaoTitleLabel.textAlignment = NSTextAlignmentCenter;
        _qiandaoTitleLabel.text = @"共累计签到";
    }return _qiandaoTitleLabel;
}

- (UILabel *)qiandaoLabel
{
    if (!_qiandaoLabel) {
        _qiandaoLabel = [[UILabel alloc]init];
        _qiandaoLabel.font = Font(15);
        _qiandaoLabel.text = @"0天";
        _qiandaoLabel.textAlignment = NSTextAlignmentCenter;
    }return _qiandaoLabel;
}

- (UILabel *)mucaibiTitleLabel
{
    if (!_mucaibiTitleLabel) {
        _mucaibiTitleLabel = [[UILabel alloc]init];
        _mucaibiTitleLabel.font = Font(12);
        _mucaibiTitleLabel.text = @"共获得木材币";
        _mucaibiTitleLabel.textAlignment = NSTextAlignmentCenter;
    }return _mucaibiTitleLabel;
}

- (UILabel *)mucaibiLabel
{
    if (!_mucaibiLabel) {
        _mucaibiLabel = [[UILabel alloc]init];
        _mucaibiLabel.font = Font(15);
        _mucaibiLabel.text = @"0";
        _mucaibiLabel.textAlignment = NSTextAlignmentCenter;
    }return _mucaibiLabel;
}

#pragma mark - buttonAction
- (void)qiandaoAction
{
    if (self.qiandaoButtonActionBlock) {
        self.qiandaoButtonActionBlock(self);
    }
}
- (void)qiandaoguizeAction
{
    if (self.qiandaoGuizeActionBlock) {
        self.qiandaoGuizeActionBlock(self);
    }
}

//
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupSubViews];
    }return self;
}

- (void)setupSubViews
{
    [self addSubview:self.titleLabel];
    [self addSubview:self.qiandaoButton];
    [self addSubview:self.childLabel];
    [self addSubview:self.qiandaoGuizeButton];
    [self addSubview:self.qiandaoTitleLabel];
    [self addSubview:self.mucaibiTitleLabel];
    [self addSubview:self.qiandaoLabel];
    [self addSubview:self.mucaibiLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 10;
    CGFloat label_height = (self.height  - padding *7)/ 8;
    CGFloat label_width = (self.width - padding *2);
    CGFloat button_size = self.width / 3;
    self.titleLabel.frame = CGRectMake(padding, padding * 2, label_width, label_height);
    self.qiandaoButton.frame = CGRectMake(self.width / 2 - button_size / 2, CGRectGetMaxY(self.titleLabel.frame) + padding, button_size, button_size);
    self.qiandaoButton.layer.cornerRadius = button_size / 2;
    
    self.childLabel.frame = CGRectMake(padding, CGRectGetMaxY(self.qiandaoButton.frame) + padding, label_width, label_height);
    self.qiandaoGuizeButton.frame = CGRectMake(self.width / 3, CGRectGetMaxY(self.childLabel.frame), self.width / 3, label_height);
    
    self.qiandaoTitleLabel.frame = CGRectMake(padding, CGRectGetMaxY(self.qiandaoGuizeButton.frame) + padding, label_width / 2, label_height);
    self.qiandaoLabel.frame = CGRectMake(padding, CGRectGetMaxY(self.qiandaoTitleLabel.frame), label_width / 2, label_height);
    self.mucaibiTitleLabel.frame = CGRectMake(CGRectGetMaxX(self.qiandaoTitleLabel.frame), CGRectGetMaxY(self.qiandaoGuizeButton.frame) + padding, label_width / 2, label_height);
    self.mucaibiLabel.frame = CGRectMake(CGRectGetMaxX(self.qiandaoLabel.frame), CGRectGetMaxY(self.qiandaoTitleLabel.frame), label_width / 2, label_height);
}

@end
