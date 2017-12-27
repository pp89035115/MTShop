//
//  MTHomePinPaiCell.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/27.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTHomePinPaiCell.h"
#import "UIImageView+WebCache.h"
@interface MTHomePinPaiCell ()
@property (nonatomic ,strong)UIImageView *pinpaiImage;
@end

@implementation MTHomePinPaiCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }return self;
}

- (void)setImageUrl:(NSString *)imageUrl
{
    NSLog(@" +++ image Url : %@ ",imageUrl);
    _imageUrl = imageUrl;
    [self.pinpaiImage sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
//    [self.pinpaiImage sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:nil];
}


- (UIImageView *)pinpaiImage
{
    if (!_pinpaiImage) {
        _pinpaiImage = [UIImageView new];
        _pinpaiImage.image = [UIImage imageNamed:@"pinpaiLogo"];
    }return _pinpaiImage;
}

- (void)setupUI
{
    [self.contentView addSubview:self.pinpaiImage];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.pinpaiImage.frame = CGRectMake(0, 0, self.width, self.height);
}

@end
