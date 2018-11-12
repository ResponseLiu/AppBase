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
        
        self.input_field = [JCLKitObj JCLField:self font:16*JCLWIDTH/375 color:JCLRGBA(255, 255, 255, 1) delegate:nil];
        self.input_field.layer.borderWidth = 1;
        [self.input_field setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
//        self.input_field.placeholder = @"11111";
        self.input_field.layer.borderColor = JCLRGBA(200, 200, 200, 1).CGColor;
    }
    
    return self;
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.text_lab.frame = CGRectMake(0, 0, 100*JCLWIDTH/375, 20);
    self.input_field.frame = CGRectMake(0, self.text_lab.maxY+5, self.frame.size.width, 40*JCLWIDTH/375);
    
    
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
