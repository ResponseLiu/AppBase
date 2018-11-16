//
//  TransferRecordCell.m
//  AppBaseWork
//
//  Created by apple on 2018/11/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TransferRecordCell.h"

@implementation TransferRecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        _trans_name = [JCLKitObj JCLLable:self font:13*JCLWIDTH/375 color:JCLRGBA(30, 30, 30, 1) alignment:0];
        _trans_name.text = @"可转账数量:0.00";
        _trans_name.frame = CGRectMake(15*JCLWIDTH/375, 0, JCLWIDTH/2-15*JCLWIDTH/375, 30*JCLWIDTH/375);
        
        _was_trans_name = [JCLKitObj JCLLable:self font:13*JCLWIDTH/375 color:JCLRGBA(30, 30, 30, 1) alignment:2];
        _was_trans_name.text = @"可转账数量:0.00";
        _was_trans_name.frame = CGRectMake(JCLWIDTH-JCLWIDTH/2, 0, JCLWIDTH/2-15*JCLWIDTH/375, 30*JCLWIDTH/375);
        
        
        _time = [JCLKitObj JCLLable:self font:13*JCLWIDTH/375 color:JCLRGBA(30, 30, 30, 1) alignment:0];
        _time.text = @"可转账数量:0.00";
        _time.frame = CGRectMake(15*JCLWIDTH/375, _trans_name.maxY, JCLWIDTH/2-15*JCLWIDTH/375, 29*JCLWIDTH/375);
        
        _number = [JCLKitObj JCLLable:self font:13*JCLWIDTH/375 color:JCLRGBA(30, 30, 30, 1) alignment:2];
        _number.text = @"可转账数量:0.00";
        _number.frame = CGRectMake(JCLWIDTH-JCLWIDTH/2,  _trans_name.maxY, JCLWIDTH/2-15*JCLWIDTH/375, 29*JCLWIDTH/375);
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 59*JCLWIDTH/375, JCLWIDTH, 1)];
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
