//
//  GQViewController.m
//  AppBaseWork
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "GQViewController.h"
#import "GQHeader.h"
#import "GQCell.h"
@interface GQViewController ()

@end

@implementation GQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navi.middle.title = @"股权";
    self.table.height = JCLHEIGHT - JCLNAVI;
    self.table.tableHeaderView = [self Header];
    self.table.backgroundColor = JCLRGB(34, 35, 54);
   [JCLHttps getJson:[NSString stringWithFormat:@"%@/user/getStocks",BaseUrl] success:^(id obj) {
       
         if ([obj[@"code"]intValue]==200) {
             
             self.vals = obj[@"data"];
             [self.table reloadData];
             
         }else{
           [MBProgressHUD showError:obj[@"msg"]];
        }

    }];
    // Do any additional setup after loading the view.
}
-(GQHeader *)Header{
    
    GQHeader *header = [[GQHeader alloc]initWithFrame:CGRectMake(0, 0, JCLWIDTH, 41*JCLWIDTH/375)];
    return header;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.vals.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 41*JCLWIDTH/375;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GQCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[GQCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    NSDictionary *dic = self.vals[indexPath.row];
    cell.account_lab.text  =  [NSString stringWithFormat:@"%@",dic[@"stockName"]];
    cell.name_lab.text  =  [NSString stringWithFormat:@"%@",dic[@"stockNum"]];
    cell.selectionStyle = 0;
    cell.backgroundColor = JCLRGB(34, 35, 54);
    return cell;
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
