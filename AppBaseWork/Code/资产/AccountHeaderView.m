//
//  AccountHeaderView.m
//  AppBaseWork
//
//  Created by apple on 2018/11/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "AccountHeaderView.h"

@implementation AccountHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        _bg_img = [JCLKitObj JCLImage:self];
        _bg_img.frame = self.bounds;
        [_bg_img sd_setImageWithURL:[NSURL URLWithString:@"http://i2.tiimg.com/564116/44765f70032629b0.jpg"]];
        
       _scan_img = [JCLKitObj JCLImage:self];
       _scan_img.frame = CGRectMake(40*JCLWIDTH/375, 30*JCLWIDTH/375, 45*JCLWIDTH/375,  45*JCLWIDTH/375);
       _scan_img.image = [UIImage imageNamed:@"saoma"];
        [self addSubview:_scan_img];
        
        
        UIImageView *middle = [JCLKitObj JCLImage:self];
        middle.frame = CGRectMake(JCLWIDTH/2-30*JCLWIDTH/375, 20*JCLWIDTH/375, 60*JCLWIDTH/375,  60*JCLWIDTH/375);
        middle.image = [UIImage imageNamed:@"icon-60的副本"];
        [self addSubview:middle];
        
        
        _code_img = [JCLKitObj JCLImage:self];
        _code_img.frame = CGRectMake(JCLWIDTH-85*JCLWIDTH/375, 30*JCLWIDTH/375, 45*JCLWIDTH/375,45*JCLWIDTH/375);
        _code_img.image = [UIImage imageNamed:@"erweima"];
        [self addSubview:_code_img];
        
        UILabel *text_lab = [JCLKitObj JCLLable:self font:18*JCLWIDTH/375 color:JCLRGBA(255, 255, 255, 1) alignment:1];
        text_lab.text = @"HTY资产智能管家";
        text_lab.frame = CGRectMake(0, middle.maxY+30*JCLWIDTH/375, JCLWIDTH, 20);
        
        _total_money = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(255, 255, 255, 1) alignment:1];
        _total_money.text = @"总资产:0.00";
        _total_money.frame = CGRectMake(15*JCLWIDTH/375, text_lab.maxY+25*JCLWIDTH/375, JCLWIDTH/2-20*JCLWIDTH/375, 20*JCLWIDTH/375);
        
        
        
        _not_useMoney = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(255, 255, 255, 1) alignment:1];
        _not_useMoney.text = @"冻结资产:0.00";
        _not_useMoney.frame = CGRectMake(JCLWIDTH/2+15*JCLWIDTH/375, text_lab.maxY+25*JCLWIDTH/375, JCLWIDTH/2-20*JCLWIDTH/375, 20*JCLWIDTH/375);
    }
    
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
