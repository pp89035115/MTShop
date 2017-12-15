//
//  NSDictionary+BHExtension.m
//  BaiHaiShop
//
//  Created by Bai_Hai_LionYang on 2016/11/19.
//  Copyright © 2016年 LionYang. All rights reserved.
//

#import "NSDictionary+BHExtension.h"

@implementation NSDictionary (BHExtension)

- (NSDictionary *)deleteAllNullValue{
    
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] init];
    
    for (NSString *keyStr in self.allKeys) {
        
        if ([[self objectForKey:keyStr] isEqual:[NSNull null]]) {
            
            [mutableDic setObject:@"" forKey:keyStr];
        }
        else{
            
            [mutableDic setObject:[self objectForKey:keyStr] forKey:keyStr];
        }
    }
    return mutableDic;
}
@end
