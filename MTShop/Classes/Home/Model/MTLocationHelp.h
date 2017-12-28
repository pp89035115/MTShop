//
//  MTLocationHelp.h
//  MTShop
//
//  Created by DQ_Yang on 2017/12/28.
//  Copyright © 2017年 MT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
typedef void(^LocationPlacemark)(CLPlacemark *placemark);
typedef void(^LocationFailed)(NSError *error);
typedef void(^LocationStatus)(CLAuthorizationStatus status);

@interface MTLocationHelp : NSObject
+ (instancetype)sharedInstance;
- (void)getLocationPlacemark:(LocationPlacemark)placemark status:(LocationStatus)status didFailWithError:(LocationFailed)error;
@end
