//
//  SendOutViewControllerViewController.h
//  AppBaseWork
//
//  Created by apple on 2018/11/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface SendOutViewControllerViewController : YSTableList
@property(nonatomic,strong)AccountModel *model;
@end

NS_ASSUME_NONNULL_END
