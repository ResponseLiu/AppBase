//
//  WebViewController.h
//  JCLMarketKit
//
//  Created by apple on 2018/3/19.
//  Copyright © 2018年 邢昭俊. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>


@interface WebViewController : JCLKitList
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, copy) void (^popActionBlock)();
@end
