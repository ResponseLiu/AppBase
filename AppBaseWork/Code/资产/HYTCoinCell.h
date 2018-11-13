//
//  HYTCoinCell.h
//  AppBaseWork
//
//  Created by apple on 2018/11/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HYTCoinCell : UITableViewCell

@property(nonatomic,strong)UIImageView *banner;

@property(nonatomic,strong)UILabel *name_lab;

@property(nonatomic,strong)UILabel *price;

@property(nonatomic,strong)UILabel *Aboutprice;

@property(nonatomic,strong)AccountModel *model;

@end

NS_ASSUME_NONNULL_END
