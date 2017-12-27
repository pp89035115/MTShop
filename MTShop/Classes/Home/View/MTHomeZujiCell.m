//
//  MTHomeZujiCell.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/26.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTHomeZujiCell.h"

@interface MTHomeZujiCell ()
@property (nonatomic ,strong)UIButton *zujiButton;
@property (nonatomic ,strong)UILabel *zujiLabel;
@end

@implementation MTHomeZujiCell

- (UIButton *)zujiButton
{
    if (!_zujiButton) {
        _zujiButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_zujiButton setImage:[UIImage imageNamed:@"home_city_more"] forState:UIControlStateNormal];
        [_zujiButton setTitle:@"足迹" forState:UIControlStateNormal];
        [_zujiButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _zujiButton.titleLabel.font = Font(11);
    }return _zujiButton;
}

- (UILabel *)zujiLabel
{
    if (!_zujiLabel) {
        _zujiLabel = [[UILabel alloc]init];
        _zujiLabel.font = Font(11);
    }return _zujiLabel;
}


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellId = @"MTHomeZujiCell";
    MTHomeZujiCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[MTHomeZujiCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }return cell;
}


- (void)setupSubViews
{
    [self.contentView addSubview:self.zujiButton];
    [self.contentView addSubview:self.zujiLabel];
}

+ (CGFloat)getCellHeight
{
    return gScreenWidth / 16;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat button_w = self.width / 6;
    self.zujiButton.frame = CGRectMake(0, 0, button_w, self.height);
    [self.zujiButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -_zujiButton.imageView.size.width, 0, _zujiButton.imageView.size.width)];
    [self.zujiButton setImageEdgeInsets:UIEdgeInsetsMake(0, _zujiButton.titleLabel.bounds.size.width, 0, -_zujiButton.titleLabel.bounds.size.width)];
    self.zujiLabel.frame = CGRectMake(CGRectGetMaxX(self.zujiButton.frame), 0, self.width - button_w, self.height);
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
