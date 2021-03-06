//
//  MTHomeShishiCell.m
//  MTShop
//
//  Created by DQ_Yang on 2017/12/27.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTHomeShishiCell.h"
#import "GYRollingNoticeView.h"
#import "MTHomeShishiRollingCell.h"

@interface MTHomeShishiCell ()
<
    GYRollingNoticeViewDelegate,
    GYRollingNoticeViewDataSource
>
@property (nonatomic ,strong)GYRollingNoticeView *rollingView;
@end

@implementation MTHomeShishiCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]){
        [self setupUI];
    }return self;
}

- (GYRollingNoticeView *)rollingView
{
    if (!_rollingView) {
        _rollingView = [[GYRollingNoticeView alloc]init];
        _rollingView.delegate = self;
        _rollingView.dataSource = self;
    }return _rollingView;
}

- (void)setupUI{
    [self.rollingView registerClass:[MTHomeShishiRollingCell class] forCellReuseIdentifier:@"MTHomeShishiRollingCell"];
    [self.rollingView reloadDataAndStartRoll];
    [self.contentView addSubview:self.rollingView];
}

#pragma mark - <GYRollingNoticeViewDelegate,GYRollingNoticeViewDataSource>
- (NSInteger)numberOfRowsForRollingNoticeView:(GYRollingNoticeView *)rollingView
{
    return 3;
}

- (GYNoticeViewCell *)rollingNoticeView:(GYRollingNoticeView *)rollingView cellAtIndex:(NSUInteger)index
{
    MTHomeShishiRollingCell *cell = [rollingView dequeueReusableCellWithIdentifier:@"MTHomeShishiRollingCell"];
    return cell;
}

- (void)didClickRollingNoticeView:(GYRollingNoticeView *)rollingView forIndex:(NSUInteger)index
{
    NSLog(@"点击的index: %ld", index);

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.rollingView.frame = CGRectMake(0, 0, self.width, self.height);
}
@end
