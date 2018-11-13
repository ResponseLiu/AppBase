//
//  AccountHeaderView.h
//  AppBaseWork
//
//  Created by apple on 2018/11/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AccountHeaderView : UIView
@property(nonatomic,strong)UIImageView *bg_img;
@property(nonatomic,strong)UIImageView *scan_img;
@property(nonatomic,strong)UIImageView *code_img;
@property(nonatomic,strong)UILabel *total_money;
@property(nonatomic,strong)UILabel *not_useMoney;
@end

NS_ASSUME_NONNULL_END
