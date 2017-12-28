//
//  MTCityLocationView.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/28.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTCityLocationView.h"
#import "MTLocationHelp.h"
#import "Masonry.h"
#define kButtonColor MTMainColor

@interface MTCityLocationView ()
/** 当前定位城市 */
@property (strong, nonatomic) UILabel *cityLabel;
@end

@implementation MTCityLocationView

+ (instancetype)cityLocationView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        [self setupView];
        
    }
    return self;
}

- (void)setLocationCity:(NSString *)locationCity {
    _locationCity = locationCity;
    
    [self.cityButton setTitle:locationCity forState:UIControlStateNormal];
}

#pragma mark -- 视图
- (void)setupView {
    
    [self addSubview:self.cityLabel];
    [self addSubview:self.cityButton];
    [self addSubview:self.locationButton];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = MTMainColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
    
    [self setupConstraints];
}

#pragma mark -- 约束
- (void)setupConstraints {
    
    [self.cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(12);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.cityButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.cityLabel.mas_right).offset(14);
        make.width.mas_equalTo(91);
        make.height.mas_equalTo(27);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.locationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-21);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(27);
        make.centerY.equalTo(self.mas_centerY);
    }];
}


#pragma mark -- 懒加载
- (UILabel *)cityLabel {
    if (!_cityLabel) {
        _cityLabel = [UILabel new];
        _cityLabel.text = @"当前定位城市";
        _cityLabel.font = [UIFont systemFontOfSize:12.0];
        _cityLabel.textColor = MTMainColor;
    }
    return _cityLabel;
}

- (UIButton *)cityButton {
    if (!_cityButton) {
        _cityButton = [UIButton new];
        [_cityButton setTitle:@"未知" forState:UIControlStateNormal];
        [_cityButton setTitleColor:kButtonColor forState:UIControlStateNormal];
        _cityButton.titleLabel.font = [UIFont systemFontOfSize:13.0];
        _cityButton.layer.borderWidth = 1;
        _cityButton.layer.borderColor = kButtonColor.CGColor;
        _cityButton.layer.cornerRadius = 2;
        _cityButton.layer.masksToBounds = YES;
        _cityButton.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return _cityButton;
}

- (UIButton *)locationButton {
    if (!_locationButton) {
        _locationButton = [UIButton new];
        [_locationButton setTitle:@"重新定位" forState:UIControlStateNormal];
        [_locationButton setTitleColor:kButtonColor forState:UIControlStateNormal];
        [_locationButton setImage:[UIImage imageNamed:@"againLocation"] forState:UIControlStateNormal];
        _locationButton.titleEdgeInsets = UIEdgeInsetsMake(0, 6, 0, 0);
        _locationButton.titleLabel.font = [UIFont systemFontOfSize:13.0];
    }
    return _locationButton;
}

@end
