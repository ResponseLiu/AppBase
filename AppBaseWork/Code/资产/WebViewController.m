//
//  WebViewController.m
//  JCLMarketKit
//
//  Created by apple on 2018/3/19.
//  Copyright © 2018年 邢昭俊. All rights reserved.
//

#import "WebViewController.h"
#import "JCLProgressLayer.h"
@interface WebViewController ()<UIWebViewDelegate,UIAlertViewDelegate> {
    
    JCLProgressLayer *_progress;
    
}
@property(nonatomic,strong)NSString *title_string;
@property (nonatomic, strong) UIWebView *web;
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navi.middle.title = self.name;
    UIButton *back = [JCLKitObj JCLButton:self.navi img:@"" size:16 target:self action:@selector(backAction)];
    back.frame = CGRectMake(0, 20, 44, 44);
    
    self.web = [[UIWebView alloc] init]; [self.view addSubview:self.web];
    self.web .backgroundColor = [UIColor whiteColor];
    self.web.delegate = self;
    self.web .frame = CGRectMake(0, JCLNAVI+2, JCLWIDTH, JCLHEIGHT - JCLNAVI);
    [self.web  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    _progress = [[JCLProgressLayer alloc]init];
    _progress.frame =CGRectMake(0, self.navi.maxY, JCLWIDTH, 5);
    [self.navi.layer addSublayer:_progress];
    // Do any additional setup after loading the view.
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    [_progress startLoadProgress];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [_progress endLoadProgress];
}

-(void)backAction{
    if (self.web.canGoBack) {
        [self.web goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
