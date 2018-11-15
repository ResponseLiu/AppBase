//
//  PersonalHeader.m
//  AppBaseWork
//
//  Created by apple on 2018/11/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PersonalHeader.h"
#import "UIImageView+WebCache.h"
@implementation PersonalHeader

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UIImageView *bg = [JCLKitObj JCLImage:self];
        bg.frame = self.bounds;
        [bg sd_setImageWithURL:[NSURL URLWithString:@"http://i4.fuimg.com/564116/b2aac153085c2266.jpg"]];
        
        UIImageView *banner = [JCLKitObj JCLImage:self];
        banner.frame = CGRectMake(JCLWIDTH/2-35*JCLWIDTH/375, 30*JCLWIDTH/375, 70*JCLWIDTH/375, 70*JCLWIDTH/375);
        banner.image = [UIImage imageNamed:@"icon-60的副本"];
        
        _name_lab = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(255, 255, 255, 1) alignment:1];
        _name_lab.text = [UserData getUserInfo].username;
        _name_lab.frame = CGRectMake(0, banner.maxY+15*JCLWIDTH/375, JCLWIDTH, 20*JCLWIDTH/375);
    }
    
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
