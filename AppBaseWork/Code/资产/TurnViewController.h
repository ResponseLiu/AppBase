//
//  TurnViewController.h
//  AppBaseWork
//
//  Created by 霍文梦 on 2018/11/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountModel.h"
@interface TurnViewController : YSTableList
@property(nonatomic,strong)AccountModel *model;
@property(nonatomic,strong)NSString *total_num;
@end
