//
//  MTCityCell.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/28.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTCityCell.h"

@interface MTCityCell ()
@property (nonatomic ,strong)UILabel *cityNameLabel;
@property (nonatomic ,strong)UIImageView *citySelectedImageView;
@end

@implementation MTCityCell


+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *cellId = @"MTCityCell";
    MTCityCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[MTCityCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }return cell;
}

- (UILabel *)cityNameLabel
{
    if (!_cityNameLabel) {
        _cityNameLabel = [UILabel new];
        _cityNameLabel.font = Font(15);
    }return _cityNameLabel;
}

- (UIImageView *)citySelectedImageView
{
    if (!_citySelectedImageView) {
        _citySelectedImageView = [UIImageView new];
        _citySelectedImageView.image = [UIImage imageNamed:@"home_city_selected"];
    }return _citySelectedImageView;
}


- (void)setupSubViews
{
    [self.contentView addSubview:self.cityNameLabel];
    [self.contentView addSubview:self.citySelectedImageView];
}

- (void)setCity:(MTCity *)city
{
    _city = city;
    self.cityNameLabel.text = city.name;
    self.citySelectedImageView.hidden = !city.isSelected;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat padding = 10;
    CGFloat label_h = self.height - padding *2;
    CGFloat image_size = self.height / 3;
    self.cityNameLabel.frame = CGRectMake(padding *2, padding, self.width / 2, label_h);
    self.citySelectedImageView.frame = CGRectMake(self.width - padding - image_size, image_size, image_size, image_size);
}


- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
