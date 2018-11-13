//
//  JCLProgressLayer.h
//  JCLMarketKit
//
//  Created by apple on 2018/8/3.
//  Copyright © 2018年 邢昭俊. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface JCLProgressLayer : CAShapeLayer{
    

    NSTimer *_timer;
    CGFloat add_speed;

}
-(void)startLoadProgress;
-(void)endLoadProgress;
@end
