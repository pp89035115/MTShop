//
//  MTMineView.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/15.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTMineView.h"

@interface MTMineView ()
@property (nonatomic ,strong)UIImageView *avatarView;
@property (nonatomic ,strong)UILabel *nameLabel;
@property (nonatomic ,strong)UIButton *settingButton;
@end

@implementation MTMineView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }return self;
}

- (UIImageView *)avatarView
{
    if (!_avatarView) {
        _avatarView = [[UIImageView alloc]init];
        _avatarView.backgroundColor = LHSeperatorColor;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(avatarAction)];
        [_avatarView addGestureRecognizer:tap];
    }return _avatarView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = Font(15);
        _nameLabel.text = @"请登录";
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.textColor = [UIColor whiteColor];
//        _nameLabel.backgroundColor = LHRandomColor;
    }return _nameLabel;
}

- (UIButton *)settingButton
{
    if (!_settingButton) {
        _settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_settingButton setTitle:@"设置" forState:UIControlStateNormal];
        _settingButton.titleLabel.font = Font(15);
//        _settingButton.backgroundColor = LHRandomColor;
    }return _settingButton;
}

#pragma mark - setupUI
- (void)setupUI
{
    [self addSubview:self.avatarView];
    [self addSubview:self.nameLabel];
    [self addSubview:self.settingButton];
}
#pragma mark - buttonAction
- (void)avatarAction
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(mt_mineViewAvatarClick:)]) {
        [self.delegate mt_mineViewAvatarClick:self];
    }
}
- (void)settingAction
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(mt_mineViewSettingClick:)]) {
        [self.delegate mt_mineViewSettingClick:self];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 20;
    CGFloat avatar_size = self.width / 3;
    self.avatarView.frame = CGRectMake(self.width / 2 - avatar_size / 2, padding *2, avatar_size, avatar_size);
    self.avatarView.layer.cornerRadius = avatar_size / 2;
    self.avatarView.layer.masksToBounds = YES;
    self.nameLabel.frame = CGRectMake(padding, CGRectGetMaxY(self.avatarView.frame) + padding, self.width - padding *2, 30);
    self.settingButton.frame = CGRectMake(self.width - avatar_size, padding, avatar_size, 30);
}

@end
