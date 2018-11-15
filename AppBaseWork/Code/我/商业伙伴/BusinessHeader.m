//
//  BusinessHeader.m
//  AppBaseWork
//
//  Created by 霍文梦 on 2018/11/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "BusinessHeader.h"

@implementation BusinessHeader

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        _account_lab = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(70, 70, 70, 1) alignment:1];
        _account_lab.text = @"账号";
        _account_lab.frame = CGRectMake(0, 0, JCLWIDTH/3, 59*JCLWIDTH/375);
        
        
        _name_lab = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(70, 70, 70, 1) alignment:1];
        _name_lab.text = @"姓名";
        _name_lab.frame = CGRectMake(JCLWIDTH/3, 0, JCLWIDTH/3, 59*JCLWIDTH/375);
        
        
        _status_lab = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(70, 70, 70, 1) alignment:1];
        _status_lab.text = @"状态";
        _status_lab.frame = CGRectMake(JCLWIDTH/3*2, 0, JCLWIDTH/3, 59*JCLWIDTH/375);
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 59*JCLWIDTH/375, JCLWIDTH, 1)];
        line.backgroundColor = JCLRGBA(220, 220, 220, 1);
        [self addSubview:line];
        
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
