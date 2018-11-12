//
//  YSTableList.m
//  Jincelue_iOS
//
//  Created by 邢昭俊 on 2017/4/1.
//  Copyright © 2017年 邢昭俊. All rights reserved.
//

#import "YSTableList.h"

@interface YSTableList ()
@end

@implementation YSTableList
-(void)viewDidLoad {
    [super viewDidLoad];
    self.table = [JCLKitObj JCLTable:self.view target:self frame:CGRectMake(0, JCLNAVI, JCLWIDTH, JCLSCROLL) style:UITableViewStylePlain];
    self.table.backgroundColor = JCLRGBA(240, 240, 240, 1);
    self.vals = [[NSMutableArray alloc]init];
    self.arrM = [[NSMutableArray alloc]init];
    
}

//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{ return 0; }
-(nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{ UIView *head; return head; };
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{ return 0; }

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{ return 0; }
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{ return 0; }
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{ UITableViewCell *cell; return cell; }

-(nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *foot; foot.backgroundColor = JCLBGRGB; return foot;
};
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{ return 0; }
    
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{ }

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{ [self.view endEditing:YES]; }
@end
