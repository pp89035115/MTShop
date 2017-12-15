//
//  UIScrollView+Draging.m
//  WNShop
//
//  Created by Lion on 16/5/11.
//  Copyright (c) 2015年 LionYang. All rights reserved.
//

#import "UIScrollView+Draging.h"
#import "MJRefresh.h"

@interface UIScrollView()

@property (nonatomic, assign) float originContentHeight;

@end

@implementation UIScrollView (Draging)

static const float kAnimationDuration = 0.25f;

static const char jy_originContentHeight;
static const char jy_secondScrollView;

- (void)setOriginContentHeight:(float)originContentHeight {
    objc_setAssociatedObject(self, &jy_originContentHeight, @(originContentHeight), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (float)originContentHeight {
    return [objc_getAssociatedObject(self, &jy_originContentHeight) floatValue];
}


- (void)setFirstScrollView:(UIScrollView *)firstScrollView {
    [self addFirstScrollViewFooter];
}

- (UIScrollView *)secondScrollView {
    return objc_getAssociatedObject(self, &jy_secondScrollView);
}

- (void)setSecondScrollView:(UIScrollView *)secondScrollView {
    
    objc_setAssociatedObject(self, &jy_secondScrollView, secondScrollView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self addFirstScrollViewFooter];
    
    CGRect frame = self.bounds;
    frame.origin.y = self.contentSize.height + self.mj_footer.frame.size.height + 120;
    secondScrollView.frame = frame;
    [self addSubview:secondScrollView];
    [self addSecondScrollViewHeader];
}

- (void)addFirstScrollViewFooter {
    __weak __typeof(self) weakSelf = self;
    MJRefreshBackStateFooter *footer = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
        [weakSelf endFooterRefreshing];
    }];
    footer.automaticallyChangeAlpha = 2;
    [footer setTitle:@"继续拖动,查看实时推荐" forState:MJRefreshStateIdle];
    self.mj_footer = footer;
}

- (void)addSecondScrollViewHeader {
    __weak __typeof(self) weakSelf = self;
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf endHeaderRefreshing];
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    [header setTitle:@"下拉,返回首页" forState:MJRefreshStateIdle];
    [header setTitle:@"释放,返回首页" forState:MJRefreshStatePulling];
    self.secondScrollView.mj_header = header;
}

- (void)endFooterRefreshing {
    [self.mj_footer endRefreshing];
    self.mj_footer.hidden = YES;
    self.scrollEnabled = NO;
    self.secondScrollView.mj_header.hidden = NO;
    self.secondScrollView.scrollEnabled = YES;
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.contentInset = UIEdgeInsetsMake( - self.contentSize.height - self.mj_footer.frame.size.height, 0, 0, 0);
    }];
    self.originContentHeight = self.contentSize.height;
    self.contentSize = self.secondScrollView.contentSize;
}

- (void)endHeaderRefreshing {
    [self.secondScrollView.mj_header endRefreshing];
    self.secondScrollView.mj_header.hidden = YES;
    self.secondScrollView.scrollEnabled = NO;
    self.scrollEnabled = YES;
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.contentInset = UIEdgeInsetsMake(0, 0, self.mj_footer.frame.size.height, 0);
    }];
    self.contentSize = CGSizeMake(0, self.originContentHeight);
    [self setContentOffset:CGPointZero animated:YES];
    [self addFirstScrollViewFooter];
}

@end
