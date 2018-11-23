//
//  RedGuCell.m
//  AppBaseWork
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "RedGuCell.h"

@implementation RedGuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        _price_one = [JCLKitObj JCLLable:self font:15*JCLWIDTH/375 color:JCLRGBA(50, 50, 50, 1) alignment:0];
        _price_one.frame = CGRectMake(15*JCLWIDTH/375, 0, JCLWIDTH/2-15*JCLWIDTH/375, 50*JCLWIDTH/375);
        
        _price_two = [JCLKitObj JCLLable:self font:15*JCLWIDTH/375 color:JCLRGBA(50, 50, 50, 1) alignment:2];
        _price_two.frame = CGRectMake(JCLWIDTH-JCLWIDTH/2, 0, JCLWIDTH/2-15*JCLWIDTH/375, 50*JCLWIDTH/375);
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 50*JCLWIDTH/375, JCLWIDTH, 1)];
        line.backgroundColor = JCLRGBA(220, 220, 220, 1);
        [self addSubview:line];
 
    }
    
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
