//
//  RecordCell.h
//  AppBaseWork
//
//  Created by apple on 2018/11/14.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RecordCell : UITableViewCell
@property(nonatomic,strong)UIImageView *banner;
@property(nonatomic,strong)UILabel *kind;
@property(nonatomic,strong)UILabel *time;
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *number;
@end

NS_ASSUME_NONNULL_END
