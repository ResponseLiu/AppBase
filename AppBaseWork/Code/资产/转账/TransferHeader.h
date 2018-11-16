//
//  TransferHeader.h
//  AppBaseWork
//
//  Created by apple on 2018/11/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TransferHeader : UIView
@property(nonatomic,strong)UILabel *user_num;

@property(nonatomic,assign)int type;
@property(nonatomic,assign)float hytprice;
@property(nonatomic,strong)UILabel *rmb_lab;
@property(nonatomic,strong)UILabel *hyt_lab;
@property(nonatomic,strong)UILabel *red_lab;
@property(nonatomic,strong)UITextField *input;
@property(nonatomic,strong)UITextField *hyt_money;
@property(nonatomic,strong)UITextField *code_Field;
@property(nonatomic,strong)UITextField *tradesecure_Field;
@end

NS_ASSUME_NONNULL_END
