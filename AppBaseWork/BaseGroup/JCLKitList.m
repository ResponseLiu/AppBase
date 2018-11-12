//
//  BaseController.m
//  BaoGang_iOS
//
//  Created by 邢昭俊 on 8/29/16.
//  Copyright © 2016 邢昭俊. All rights reserved.
//
#import "JCLKitList.h"
#import "UIButton+Category.h"
@implementation JCLKitNavi

-(instancetype)initWithFrame:(CGRect)frame{
  
    if (self = [super initWithFrame:frame]) {

        self.backgroundColor = JCLRGBA(60, 136, 201, 1);
        self.bg = [JCLKitObj JCLView:self color: JCLRGBA(60, 136, 201, 1)];
        self.left = [JCLKitObj JCLButton:self.bg img:nil size:14 target:self action:nil];
        self.right = [JCLKitObj JCLButton:self.bg img:nil size:14 target:self action:nil];
        self.middle = [JCLKitObj JCLButton:self.bg img:nil size:18 target:self action:nil];
        self.subMiddle = [JCLKitObj JCLButton:self.bg img:nil size:12 target:self action:nil];
        self.left.img=@"返回";
        UIColor *col = JCLRGBA(255, 255, 255, 1);
        self.middle.color = col; self.subMiddle.color = col; self.left.color = col; self.right.color = col;
    }
    return self;
}
-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.bg.frame = CGRectMake(0, 0, self.width, self.height - 1);
    CGFloat y = iPhoneX?25:20, w = 55, h = self.bg.height - y;
    self.left.frame = CGRectMake(0, y, w, h);
    self.right.frame = CGRectMake(self.width - w, y, w, h);
    if (self.subMiddle.titleLabel.text.length) {
        CGSize middleSize = [JCLKitObj JCLTextSize:self.middle.titleLabel.text font:self.middle.titleLabel.font];
        CGSize subSize = [JCLKitObj JCLTextSize:self.subMiddle.titleLabel.text font:self.subMiddle.titleLabel.font];
        CGFloat middleY = 0.5*(h - middleSize.height - subSize.height);
        self.middle.frame = CGRectMake(self.left.maxX, y + middleY, self.width - 2*w, middleSize.height);
        self.subMiddle.frame = CGRectMake(self.left.maxX, self.middle.maxY, self.width - 2*w, subSize.height);
    } else {
        self.middle.frame = CGRectMake(self.left.maxX, y, self.width - 2*w, h);
    }
}
@end

@implementation JCLKitList

-(void)viewDidLoad{
    
    [super viewDidLoad];
    self.view.backgroundColor = JCLRGBA(255, 255, 255, 1);
    JCLKitNavi *navi = [[JCLKitNavi alloc]initWithFrame:CGRectMake(0, 0, JCLWIDTH, JCLNAVI)]; [self.view addSubview:navi];
    [navi.left addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    [navi.right addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    [navi.middle addTarget:self action:@selector(middleAction) forControlEvents:UIControlEventTouchUpInside];
    self.navi = navi;
}

-(void)leftAction{  !self.leftActionBlock ? :self.leftActionBlock();
    if (!self.navi.left.title.length) { [self.navigationController popViewControllerAnimated:YES]; }
}
-(void)rightAction{ !self.rightActionBlock ? :self.rightActionBlock(); }
-(void)middleAction{ !self.middleActionBlock ? : self.middleActionBlock(); }

// 页面将要进入前台
-(void)viewWillAppear:(BOOL)animated{ [super viewWillAppear:animated]; [self.navigationController setNavigationBarHidden:YES]; }
-(void)viewWillDisappear:(BOOL)animated{ [super viewWillDisappear:animated]; [self.navigationController setNavigationBarHidden:NO]; }

-(BOOL)shouldAutorotate{ return YES; }
-(UIInterfaceOrientationMask)supportedInterfaceOrientations{ return UIInterfaceOrientationMaskPortrait; }
-(UIStatusBarStyle)preferredStatusBarStyle{ return UIStatusBarStyleLightContent; }
@end
