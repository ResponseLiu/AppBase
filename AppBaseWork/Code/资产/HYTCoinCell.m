//
//  HYTCoinCell.m
//  AppBaseWork
//
//  Created by apple on 2018/11/13.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "HYTCoinCell.h"

@implementation HYTCoinCell

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
        
        _name_lab = [JCLKitObj JCLLable:self font:19*JCLWIDTH/375 color:JCLRGBA(30, 30, 30, 1) alignment:0];
        _name_lab.text = @"HYT";
        _name_lab.frame = CGRectMake(_banner.maxX+15*JCLWIDTH/375, 25*JCLWIDTH/375, JCLWIDTH/2, 30*JCLWIDTH/375);
        
        _price = [JCLKitObj JCLLable:self font:15*JCLWIDTH/375 color:JCLRGBA(150, 150, 150, 1) alignment:0];
        _price.text = @"1000.00";
        _price.frame = CGRectMake(JCLWIDTH-100*JCLWIDTH/375, 20*JCLWIDTH/375, 80*JCLWIDTH/375, 20*JCLWIDTH/375);
        
        _Aboutprice = [JCLKitObj JCLLable:self font:15*JCLWIDTH/375 color:JCLRGBA(150, 150, 150, 1) alignment:0];
        _Aboutprice.text = @"≈1000.00";
        _Aboutprice.frame = CGRectMake(JCLWIDTH-100*JCLWIDTH/375, _price.maxY, 100*JCLWIDTH/375, 20*JCLWIDTH/375);
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 79, JCLWIDTH, 1)];
        line.backgroundColor = JCLRGBA(220, 220, 220, 1);
        [self addSubview:line];
    }
    return self;
}
-(void)setModel:(AccountModel *)model{
    
    _model = model;
    self.price.text = [NSString stringWithFormat:@"%g",_model.number];
    self.Aboutprice.text = [NSString stringWithFormat:@"≈ $%g",_model.number*_model.price];
    self.name_lab.text = _model.name;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
