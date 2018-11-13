//
//  InputView.m
//  AppBaseWork
//
//  Created by 霍文梦 on 2018/11/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "InputView.h"

@implementation InputView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.text_lab = [JCLKitObj JCLLable:self font:15*JCLWIDTH/375 color:JCLRGBA(200, 200, 200, 1) alignment:0];
        self.text_lab.frame = CGRectMake(0, 0, 100*JCLWIDTH/375, 20);
        UIView *bg = [JCLKitObj JCLView:self color:JCLRGBA(32, 35, 54, 1)];
        bg.layer.cornerRadius = 3;
        bg.clipsToBounds = YES;
         bg.frame = CGRectMake(0, self.text_lab.maxY+5, self.frame.size.width, 45*JCLWIDTH/375);
        self.input_field = [JCLKitObj JCLField:bg font:16*JCLWIDTH/375 color:JCLRGBA(255, 255, 255, 1) delegate:nil];
//        self.input_field.layer.borderWidth = 1;
//        self.input_field.layer.borderColor = JCLRGBA(180, 180, 180, 1).CGColor;
        self.input_field.backgroundColor = JCLRGBA(32, 35, 54, 1);
    }
    return self;
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
   
    self.input_field.frame = CGRectMake(5*JCLWIDTH/375, 2.5, self.frame.size.width-5*JCLWIDTH/375, 40*JCLWIDTH/375);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
