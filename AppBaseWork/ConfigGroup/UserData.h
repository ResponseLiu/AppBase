//
//  UserData.h
//  AppBaseWork
//
//  Created by apple on 2018/11/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#define User @"user.data"
NS_ASSUME_NONNULL_BEGIN

@interface UserData : NSObject<NSCoding>
+(void)saveUserInfo:(UserData *)model;
+(UserData *)getUserInfo;
@end

NS_ASSUME_NONNULL_END
