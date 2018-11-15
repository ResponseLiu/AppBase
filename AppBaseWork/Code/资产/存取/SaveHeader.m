//
//  SaveHeader.m
//  AppBaseWork
//
//  Created by apple on 2018/11/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SaveHeader.h"

@implementation SaveHeader
-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self=[super initWithFrame:frame]) {
        
        _save_num = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGB(50, 50, 50) alignment:1];
        _save_num.frame = CGRectMake(0, 0, JCLWIDTH/2, 49*JCLWIDTH/375);
        
        _get_num = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGB(50, 50, 50) alignment:1];
        _get_num.frame = CGRectMake(JCLWIDTH/2, 0, JCLWIDTH/2, 49*JCLWIDTH/375);
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 49*JCLWIDTH/375, JCLWIDTH, 1)];
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
