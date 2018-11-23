//
//  ScanLifeViewController1.h
//  AnAnScanLife
//
//  Created by anan on 16/11/9.
//  Copyright © 2016年 anan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebViewController.h"
#import "AccountModel.h"
@interface ScanLifeViewController : YSTableList

@property (nonatomic,strong) UIViewController *controller;
@property(nonatomic,strong)AccountModel *model;
@property (nonatomic, copy) void (^ScanSuncessBlock) (ScanLifeViewController *,NSString *);//扫描结果



@end
