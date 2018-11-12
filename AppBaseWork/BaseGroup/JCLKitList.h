//
//  BaseController.h
//  BaoGang_iOS
//
//  Created by 邢昭俊 on 8/29/16.
//  Copyright © 2016 邢昭俊. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JCLKitNavi : UIView
@property(nonatomic, weak) UIView *bg;
@property(nonatomic, weak) UIButton *left;
@property(nonatomic, weak) UIButton *right;
@property(nonatomic, weak) UIButton *middle;
@property(nonatomic, weak) UIButton *subMiddle;
@end

@interface JCLKitList : UIViewController
@property(nonatomic , weak) JCLKitNavi *navi;
@property(nonatomic , assign) CGFloat listH;

@property(nonatomic, copy) void (^leftActionBlock)(void);
@property(nonatomic, copy) void (^rightActionBlock)(void);
@property(nonatomic, copy) void (^middleActionBlock)(void);
@end
