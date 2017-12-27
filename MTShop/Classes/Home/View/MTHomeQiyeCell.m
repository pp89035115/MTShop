//
//  MTHomeQiyeCell.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/27.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTHomeQiyeCell.h"

@interface MTHomeQiyeCell ()
@property (nonatomic ,strong)UILabel *nameLabel;
@property (nonatomic ,strong)UILabel *statusLabel;
@property (nonatomic ,strong)UILabel *messageLabel;
@property (nonatomic ,strong)UIButton *timeButton;
@property (nonatomic ,strong)UIButton *locationButton;
@property (nonatomic ,strong)UIButton *lookButton;
@end

@implementation MTHomeQiyeCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self.contentView setBackgroundColor:[UIColor whiteColor]];
        [self setupUI];
    }return self;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = Font(16);
        _nameLabel.text = @"求购低等级樟子松/云杉";
    }return _nameLabel;
}

- (UILabel *)statusLabel
{
    if (!_statusLabel) {
        _statusLabel = [UILabel new];
        _statusLabel.layer.borderColor = MTMainColor.CGColor;
        _statusLabel.layer.borderWidth = 1;
        _statusLabel.font = Font(10);
        _statusLabel.textColor = MTMainColor;
        _statusLabel.textAlignment = NSTextAlignmentCenter;
        _statusLabel.text = @"求购";
    }return _statusLabel;
}

- (UILabel *)messageLabel
{
    if (!_messageLabel) {
        _messageLabel = [UILabel new];
        _messageLabel.font = Font(12);
        _messageLabel.text = @"质量要求：四面见线 低等级25100云杉";
        _messageLabel.textColor = [UIColor grayColor];
    }return _messageLabel;
}

- (UIButton *)timeButton
{
    if (!_timeButton) {
        _timeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_timeButton setImage:[UIImage imageNamed:@"time_image"] forState:UIControlStateNormal];
        [_timeButton setTitle:@"2017-12-11" forState:UIControlStateNormal];
        [_timeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _timeButton.titleLabel.font = Font(13);
    }return _timeButton;
}

- (UIButton *)locationButton
{
    if (!_locationButton) {
        _locationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_locationButton setImage:[UIImage imageNamed:@"location_image"] forState:UIControlStateNormal];
        [_locationButton setTitle:@"菏泽" forState:UIControlStateNormal];
        [_locationButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _locationButton.titleLabel.font = Font(13);
    }return _locationButton;
}
- (UIButton *)lookButton
{
    if (!_lookButton) {
        _lookButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_lookButton setImage:[UIImage imageNamed:@"phone_image"] forState:UIControlStateNormal];
        [_lookButton setTitle:@"（立即查看）" forState:UIControlStateNormal];
        [_lookButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _lookButton.titleLabel.font = Font(13);
    }return _lookButton;
}

- (void)setupUI{
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.statusLabel];
    [self.contentView addSubview:self.messageLabel];
    [self.contentView addSubview:self.timeButton];
    [self.contentView addSubview:self.locationButton];
    [self.contentView addSubview:self.lookButton];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 10;
    CGFloat label_w = self.width / 3;
    CGFloat label_h = (self.height - padding *2) / 3;
    CGFloat button_w = self.width / 3;
    self.nameLabel.frame = CGRectMake(padding, padding, label_w *2, label_h);
    self.statusLabel.frame = CGRectMake(CGRectGetMaxX(self.nameLabel.frame), padding, label_w /3, label_h / 2);
    self.statusLabel.centerY = self.nameLabel.centerY;
    self.messageLabel.frame = CGRectMake(padding, CGRectGetMaxY(self.nameLabel.frame), self.width - padding *2, label_h);
    self.timeButton.frame = CGRectMake(0, CGRectGetMaxY(self.messageLabel.frame), button_w, label_h);
    self.locationButton.frame = CGRectMake(CGRectGetMaxX(self.timeButton.frame), CGRectGetMaxY(self.messageLabel.frame), button_w, label_h);
    self.lookButton.frame = CGRectMake(CGRectGetMaxX(self.locationButton.frame), CGRectGetMaxY(self.messageLabel.frame), button_w, label_h);
    
//    [self.timeButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.timeButton.imageView.size.width, 0, self.timeButton.imageView.size.width)];
//    [self.timeButton setImageEdgeInsets:UIEdgeInsetsMake(0, self.timeButton.titleLabel.bounds.size.width, 0, -self.timeButton.titleLabel.bounds.size.width)];
//
//    [self.locationButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.locationButton.imageView.size.width, 0, self.locationButton.imageView.size.width)];
//    [self.locationButton setImageEdgeInsets:UIEdgeInsetsMake(0, self.locationButton.titleLabel.bounds.size.width, 0, -self.locationButton.titleLabel.bounds.size.width)];
//
//    [self.lookButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -self.lookButton.imageView.size.width, 0, self.lookButton.imageView.size.width)];
//    [self.lookButton setImageEdgeInsets:UIEdgeInsetsMake(0, self.lookButton.titleLabel.bounds.size.width, 0, -self.lookButton.titleLabel.bounds.size.width)];
    
}

@end
