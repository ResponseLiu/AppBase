//
//  CoinHeaderView.m
//  AppBaseWork
//
//  Created by apple on 2018/11/14.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CoinHeaderView.h"

@implementation CoinHeaderView


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = JCLRGB(82, 141, 246);
        _total_number = [JCLKitObj JCLLable:self font:15*JCLWIDTH/375 color:JCLRGBA(255, 255, 255, 1) alignment:1];
        _total_number.frame = CGRectMake(0, 0, JCLWIDTH/3, 50*JCLWIDTH/375);
        
        _save_number = [JCLKitObj JCLLable:self font:15*JCLWIDTH/375 color:JCLRGBA(255, 255, 255, 1) alignment:1];
        _save_number.frame = CGRectMake(JCLWIDTH/3, 0*JCLWIDTH/375,JCLWIDTH/3, 50*JCLWIDTH/375);
        
        _use_number = [JCLKitObj JCLLable:self font:15*JCLWIDTH/375 color:JCLRGBA(255, 255, 255, 1) alignment:1];
        _use_number.frame = CGRectMake(JCLWIDTH/3*2,0, JCLWIDTH/3, 50*JCLWIDTH/375);
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
