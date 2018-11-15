//
//  PersonalCell.m
//  AppBaseWork
//
//  Created by apple on 2018/11/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PersonalCell.h"

@implementation PersonalCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _banner = [JCLKitObj JCLImage:self];
        _banner.frame = CGRectMake(20*JCLWIDTH/375, 15*JCLWIDTH/375, 25*JCLWIDTH/375,  25*JCLWIDTH/375);
        [self addSubview:_banner];
        
        _name_lab = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(100, 100, 100, 1) alignment:0];
        _name_lab.text = @"HYT";
        _name_lab.frame = CGRectMake(_banner.maxX+15*JCLWIDTH/375, 17.5*JCLWIDTH/375, JCLWIDTH/2, 20*JCLWIDTH/375);
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 54*JCLWIDTH/375, JCLWIDTH, 1)];
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
