//
//  RecordCell.m
//  AppBaseWork
//
//  Created by apple on 2018/11/14.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "RecordCell.h"

@implementation RecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _banner = [JCLKitObj JCLImage:self];
        _banner.frame = CGRectMake(20*JCLWIDTH/375, 15*JCLWIDTH/375, 50*JCLWIDTH/375,  50*JCLWIDTH/375);
        _banner.image = [UIImage imageNamed:@"icon-60的副本"];
        [self addSubview:_banner];
        
        _kind = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(30, 30, 30, 1) alignment:0];
        _kind.text = @"取出";
        _kind.frame = CGRectMake(_banner.maxX+15*JCLWIDTH/375, 15*JCLWIDTH/375, 200*JCLWIDTH/375, 25*JCLWIDTH/375);
        
        
        _time = [JCLKitObj JCLLable:self font:14*JCLWIDTH/375 color:JCLRGBA(30, 30, 30, 1) alignment:0];
        _time.text = @"HYT";
        _time.frame = CGRectMake(_banner.maxX+15*JCLWIDTH/375, _kind.maxY, 150*JCLWIDTH/375, 25*JCLWIDTH/375);
        
        _name = [JCLKitObj JCLLable:self font:14*JCLWIDTH/375 color:JCLRGBA(30, 30, 30, 1) alignment:2];
        _name.text = @"HYT";
        _name.frame = CGRectMake(JCLWIDTH-100*JCLWIDTH/375, 15*JCLWIDTH/375, 80*JCLWIDTH/375, 25*JCLWIDTH/375);
        
        _number = [JCLKitObj JCLLable:self font:14*JCLWIDTH/375 color:JCLRGBA(30, 30, 30, 1) alignment:2];
        _number.text = @"数量:100";
        _number.frame = CGRectMake(JCLWIDTH-120*JCLWIDTH/375, _kind.maxY, 100*JCLWIDTH/375, 25*JCLWIDTH/375);
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 79*JCLWIDTH/375, JCLWIDTH, 1)];
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
