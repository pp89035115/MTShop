//
//  MTMineItemCell.m
//  MTShop
//
//  Created by DQ_Yang on 2018/1/5.
//  Copyright © 2018年 MT. All rights reserved.
//

#import "MTMineItemCell.h"
@interface MTMineItemCell ()
@property (nonatomic ,strong)UIImageView *iconImage;
@property (nonatomic ,strong)UILabel *nameLabel;
@end

@implementation MTMineItemCell

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
        _nameLabel.font = Font(15);
//        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }return _nameLabel;
}

- (void)setupUI
{
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self.contentView addSubview:self.iconImage];
    [self.contentView addSubview:self.nameLabel];
}

- (void)setItemSource:(NSDictionary *)itemSource
{
    _itemSource = itemSource;
    self.iconImage.image = [UIImage imageNamed:itemSource[@"image"]];
    self.nameLabel.text = itemSource[@"name"];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 10;
    CGFloat icon_size = self.height - padding *4;
    CGFloat label_w = self.width - icon_size - padding * 4;
    CGFloat label_h = self.height - padding * 2;
    self.iconImage.frame = CGRectMake(padding *2, padding *2, icon_size, icon_size);
    self.nameLabel.frame = CGRectMake(CGRectGetMaxX(self.iconImage.frame) + padding *2, padding, label_w, label_h);
    
}
@end
