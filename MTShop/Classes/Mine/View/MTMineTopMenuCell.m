//
//  MTMineTopMenuCell.m
//  MTShop
//
//  Created by DQ_Yang on 2018/1/5.
//  Copyright © 2018年 MT. All rights reserved.
//

#import "MTMineTopMenuCell.h"

@interface MTMineTopMenuCell ()
@property (nonatomic ,strong)UIImageView *iconImage;
@property (nonatomic ,strong)UILabel *nameLabel;
@end

@implementation MTMineTopMenuCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }return self;
}

- (UIImageView *)iconImage
{
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc]init];
    }return _iconImage;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.font = Font(13);
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }return _nameLabel;
}

- (void)setupUI
{
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self.contentView addSubview:self.iconImage];
    [self.contentView addSubview:self.nameLabel];
}

- (void)setSource:(NSDictionary *)source
{
    _source = source;
    self.iconImage.image = [UIImage imageNamed:source[@"image"]];
    self.nameLabel.text = source[@"name"];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 10;
    CGFloat label_h = self.height / 3;
    CGFloat label_w = self.width - padding *2;
    CGFloat icon_size = self.height - label_h - padding *3;
    
    self.iconImage.frame = CGRectMake(self.width / 2 - icon_size / 2, padding, icon_size, icon_size);
    self.nameLabel.frame = CGRectMake(padding, CGRectGetMaxY(self.iconImage.frame) + padding, label_w, label_h);
    self.contentView.width += 1;
}

@end
