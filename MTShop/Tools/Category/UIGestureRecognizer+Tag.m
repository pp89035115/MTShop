//
//  UIGestureRecognizer+Tag.m
//  homework
//
//  Created by panxiang on 14/12/5.
//  Copyright (c) 2014年 Baidu. All rights reserved.
//

#import "UIGestureRecognizer+Tag.h"
#import <objc/runtime.h>

static const char kGestureTag;
static const char kGestureDict;

@implementation UIGestureRecognizer (Tag)

- (void)setGestureTag:(NSString *)gestureTag
{
    objc_setAssociatedObject(self, &kGestureTag, gestureTag, OBJC_ASSOCIATION_COPY);
}

- (NSString *)gestureTag
{
    NSString *tag = objc_getAssociatedObject(self, &kGestureTag);
    return tag;
}

- (void)setGestureDict:(NSDictionary *)gestureDict
{
    objc_setAssociatedObject(self, &kGestureDict, gestureDict, OBJC_ASSOCIATION_RETAIN);
}

- (NSDictionary *)gestureDict
{
    NSDictionary *gestureDict = objc_getAssociatedObject(self, &kGestureDict);
    return gestureDict;
}
@end
