//
//  SaveCell.m
//  AppBaseWork
//
//  Created by apple on 2018/11/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SaveCell.h"

@implementation SaveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        
        _title = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGB(50, 50, 50) alignment:1];
        _title.text = @"232323";
        _title.frame = CGRectMake(15*JCLWIDTH/375, 0, 70*JCLWIDTH/375, 59*JCLWIDTH/375);
        
        _input= [JCLKitObj JCLField:self font:16*JCLWIDTH/375 color:JCLRGB(50, 50, 50) delegate:nil];
        _input.frame = CGRectMake(100*JCLWIDTH/375, 0, JCLWIDTH-160*JCLWIDTH/375, 59*JCLWIDTH/375);
        _select_img = [JCLKitObj JCLImage:self];
        _select_img.frame = CGRectMake(JCLWIDTH-50*JCLWIDTH/375, 22.5*JCLWIDTH/375, 15*JCLWIDTH/375, 15*JCLWIDTH/375);
        _select_img.image = [UIImage imageNamed:@"weixuanzhong"];
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
