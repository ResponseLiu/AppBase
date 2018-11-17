//
//  NewsViewController.m
//  AppBaseWork
//
//  Created by apple on 2018/11/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()
@property (nonatomic, strong) UIWebView *web;
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.navi.middle.title = @"资讯";
    self.navi.left.hidden = YES;
    self.web = [[UIWebView alloc] init]; [self.view addSubview:self.web];
    self.web .backgroundColor = [UIColor whiteColor];
    self.web .frame = CGRectMake(0, JCLNAVI+2, JCLWIDTH, JCLHEIGHT - JCLNAVI-TABBAR);
    //    [self.web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"assets/index-info.html" relativeToURL:[[NSBundle mainBundle] bundleURL]]]];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:[[NSBundle mainBundle] pathForResource:@"index-info" ofType:@"html" inDirectory:@"infos"]]];
    [self.web loadRequest:request];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
