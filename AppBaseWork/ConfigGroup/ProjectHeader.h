//
//  ProjectHeader.h
//  AppBaseWork
//
//  Created by apple on 2018/11/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#ifndef ProjectHeader_h
#define ProjectHeader_h
#define BaseUrl   @"http://hytzfl.vip/"
#define JCLWIDTH [UIScreen mainScreen].bounds.size.width
#define JCLHEIGHT [UIScreen mainScreen].bounds.size.height
#import "JCLHttps.h"
#import "UIView+Category.h"
#import "JCLKitObj.h"
#import "UITableView+Base.h"
#import "MBProgressHUD.h"
#import "YSTableList.h"
#import "JCLKitList.h"
#import "UIButton+Category.h"
#import "UserData.h"
#import "MBProgressHUD+PD.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import "JCLColorObj.h"

#define PreRead(key) [[NSUserDefaults standardUserDefaults] objectForKey:key]
#define PreWrite(value, key) [[NSUserDefaults standardUserDefaults] setObject:value forKey:key]
#define CachesFile(value) [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:value]


//判断设备类型
#define iPhone4 ([UIScreen mainScreen].bounds.size.height == 480)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size)) : NO)
#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)
// 判断是否是iPhone X
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断是否是iPhone XR
#define iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断是否是iPhone XS
#define iPhoneXS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
// 判断是否是iPhone X Max
#define iPhoneXMax ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)
//iPhoneX系列
#define NavgationHeight 44.0f
#define STATUS_BAR_HEIGHT ((iPhoneX==YES || iPhoneXR ==YES || iPhoneXS== YES || iPhoneXMax== YES) ? 44.0 : 20.0)
#define JCLNAVI ((iPhoneX==YES || iPhoneXR ==YES || iPhoneXS== YES || iPhoneXMax== YES) ? 88.0 : 64.0)
#define TABBAR ((iPhoneX==YES || iPhoneXR ==YES || iPhoneXS== YES || iPhoneXMax== YES) ? 83.0 : 49.0)
#define JCLSCROLL  JCLHEIGHT - JCLNAVI - TABBAR

#define JCLRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a] // 获取RGB颜色值
#define JCLBGRGB JCLRGBA(244, 244, 244, 1)
#define JCLRGB(r, g, b) JCLRGBA(r, g, b, 1)

#endif /* ProjectHeader_h */
