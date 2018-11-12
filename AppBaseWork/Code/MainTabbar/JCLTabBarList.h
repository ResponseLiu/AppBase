//
//  TabBarController.h
//  RuiXueTuan
//
//  Created by 邢昭俊 on 14-6-14.
//  Copyright (c) 2014年 邢昭俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountViewController.h"
#import "MarketViewController.h"
#import "NewsViewController.h"
#import "SupMarketViewController.h"
#import "PersonalViewController.h"
@interface JCLNaviBarList : UINavigationController<UINavigationControllerDelegate,UINavigationBarDelegate>
@property(nonatomic,getter=ispushing)BOOL pushing;
@end

@interface JCLTabBar : UITabBar
@end

@interface JCLTabBarList : UITabBarController
@end
