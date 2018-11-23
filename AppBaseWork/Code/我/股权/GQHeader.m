//
//  GQHeader.m
//  AppBaseWork
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "GQHeader.h"

@implementation GQHeader


-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        
        self.backgroundColor =JCLRGB(34, 35, 54);
        _account_lab = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(255, 255, 255, 1) alignment:1];
        _account_lab.text = @"股票名称";
        _account_lab.frame = CGRectMake(0, 0, JCLWIDTH/2, 40*JCLWIDTH/375);
        
        
        _name_lab = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(255, 255, 255, 1) alignment:1];
        _name_lab.text = @"持有数量";
        _name_lab.frame = CGRectMake(JCLWIDTH/2, 0, JCLWIDTH/2, 40*JCLWIDTH/375);
        

        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 40*JCLWIDTH/375, JCLWIDTH, 1)];
        line.backgroundColor = JCLRGBA(255, 255, 255, 1);
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
