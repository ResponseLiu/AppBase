//
//  CodeViewController.m
//  AppBaseWork
//
//  Created by apple on 2018/11/17.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CodeViewController.h"
#import "CodeHeaderView.h"
@interface CodeViewController ()

@end

@implementation CodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navi.middle.title = @"扫码";
    self.table.height = JCLHEIGHT - JCLNAVI;
    self.table.tableHeaderView = [self Header];
    // Do any additional setup after loading the view.
}
-(CodeHeaderView *)Header{
    
    CodeHeaderView *code = [[CodeHeaderView alloc]initWithFrame:CGRectMake(0, 0, JCLWIDTH, JCLHEIGHT)];
    code.backgroundColor = [UIColor whiteColor];
    
    return code;
    
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
