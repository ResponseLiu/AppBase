//
//  GQCell.m
//  AppBaseWork
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "GQCell.h"

@implementation GQCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        
        _account_lab = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(255, 255, 255, 1) alignment:1];
        _account_lab.frame = CGRectMake(0, 0, JCLWIDTH/2, 40*JCLWIDTH/375);
        
        _name_lab = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(255, 255, 255, 1) alignment:1];
        _name_lab.frame = CGRectMake(JCLWIDTH/2, 0, JCLWIDTH/2, 40*JCLWIDTH/375);
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 40*JCLWIDTH/375, JCLWIDTH, 1)];
        line.backgroundColor = JCLRGBA(255, 255, 255, 1);
        [self addSubview:line];
    }
    
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
