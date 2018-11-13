//
//  JCLProgressLayer.m
//  JCLMarketKit
//
//  Created by apple on 2018/8/3.
//  Copyright © 2018年 邢昭俊. All rights reserved.
//

#import "JCLProgressLayer.h"

@implementation JCLProgressLayer
-(instancetype)init{
    
    if (self = [super init]) {
        
        [self initLine];

    }
    return self;
}
-(void)initLine{
    
    self.lineWidth = 5;
    self.strokeColor = [UIColor orangeColor].CGColor;
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.003 target:self selector:@selector(pathChanged:) userInfo:nil repeats:YES];
    [_timer setFireDate:[NSDate distantFuture]];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 2)];
    [path addLineToPoint:CGPointMake(JCLWIDTH, 2)];
    self.path = path.CGPath;
    self.strokeEnd = 0;
    add_speed = 0.01;
    
}
-(void)pathChanged:(NSTimer *)timer{
    self.strokeEnd = self.strokeEnd + add_speed;
    if (self.strokeEnd>0.8) {
        add_speed = 0.02;
    }
}
-(void)startLoadProgress{
    
    self.hidden = NO;
    self.strokeEnd = 0;
     [_timer setFireDate:[NSDate distantPast]];
}
-(void)endLoadProgress{
    
    self.strokeEnd = 1;
    self.hidden = YES;
//    [self removeFromSuperlayer];
    [_timer invalidate];
}
@end
