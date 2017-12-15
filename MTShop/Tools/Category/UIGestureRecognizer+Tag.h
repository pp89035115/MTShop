//
//  UIGestureRecognizer+Tag.h
//  homework
//
//  Created by panxiang on 14/12/5.
//  Copyright (c) 2014年 Baidu. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface UIGestureRecognizer (Tag)
@property (nonatomic ,copy)NSString *gestureTag;
@property (nonatomic ,strong)NSDictionary *gestureDict;
@end
