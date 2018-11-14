//
//  HQColorObj.m
//  JCLMarketKit
//
//  Created by 邢昭俊 on 2017/8/29.
//  Copyright © 2017年 邢昭俊. All rights reserved.
//

#import "JCLColorObj.h"

#define UpdateColor @"UpdateColor"
@implementation JCLColorObj
+(UIColor *)JCLBgCol{
    NSString *style = PreRead(UpdateColor);
    if (!style.length) {
        return JCLRGB(20, 20, 30);
    } else {
        return JCLHexCol(@"#15191D");
    }
}

+(UIColor *)JCLCellCol{
        return JCLHexCol(@"#1C1F26");
}

+(UIColor *)JCLLineCol{
        return JCLHexCol(@"#2E313A");
}

+(UIColor *)JCLKlineCol{
    NSString *style = PreRead(UpdateColor);
    if (!style.length) {
        return JCLRGB(20, 20, 30);
    } else {
        return JCLRGB(233, 233, 233);
    }
}

+(UIColor *)JCLRiseCol{
    return JCLHexCol(@"#C41A19");
}

+(UIColor *)JCLFallCol{
    return JCLHexCol(@"#248A23");
}


+(UIColor *)JCLTextCol{
    NSString *style = PreRead(UpdateColor);
    if (!style.length) {
        return [UIColor blackColor];
    } else {
        return [UIColor blackColor];
    }
}

+(UIColor *)JCLSelTextCol{
    NSString *style = PreRead(UpdateColor);
    if (!style.length) {
        return JCLHexCol(@"#3792E1");
    } else {
        return [UIColor redColor];
    }
}
@end
