//
//  TransferViewController.h
//  AppBaseWork
//
//  Created by apple on 2018/11/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface TransferViewController : YSTableList
@property(nonatomic,strong)AccountModel *model;
@property(nonatomic,strong)NSString *use_num;
@end

NS_ASSUME_NONNULL_END
