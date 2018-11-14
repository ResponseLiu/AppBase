//
//  CoinActionView.m
//  AppBaseWork
//
//  Created by apple on 2018/11/14.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CoinActionView.h"

@implementation CoinActionView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.data = [NSMutableArray array];
        for (int i=0; i<4; i++) {
            
            UILabel *label = [JCLKitObj JCLLable:self font:15*JCLWIDTH/375 color:JCLRGB(255, 255, 255) alignment:1];
            [self.data addObject:label];
            
            
        }
        
    }
    
    return self;
}
-(void)setName_Array:(NSArray *)name_Array{
    
    _name_Array = name_Array;
    for (int i=0; i<name_Array.count; i++) {
        
        CGFloat space = 3;
        CGFloat w = (JCLWIDTH-space*(_name_Array.count+1))/_name_Array.count;
        CGFloat x = i*(w+space)+space;
        UILabel *label = self.data[i];
        label.frame = CGRectMake(x, 0, w, 50*JCLWIDTH/375);
        if (i==0||i==2) {
            
            label.backgroundColor = JCLRGB(81, 141, 220);
            
        }else{
            
            label.backgroundColor = JCLRGB(104, 197, 239);
        }
        label.text = _name_Array[i];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
