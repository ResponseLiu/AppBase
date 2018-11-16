//
//  TransferRecordViewController.m
//  AppBaseWork
//
//  Created by apple on 2018/11/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TransferRecordViewController.h"
#import "TransferRecordCell.h"
@interface TransferRecordViewController ()
@property(nonatomic,strong)NSArray *data;
@end

@implementation TransferRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navi.middle.title = @"转账记录";
    self.table.height = JCLHEIGHT - JCLNAVI;
    [JCLHttps getJson:[NSString stringWithFormat:@"%@incomeMoney/stockpileWater?telphone=%@&coinCode=HYT&status=9&page=1&limit=1000",BaseUrl,[UserData getUserInfo].username] success:^(id obj) {
       
        if ([obj[@"code"]intValue]==200) {
            
            self.data = obj[@"data"][@"data"];
            [self.table reloadData];
        }
        NSLog(@"%@",obj);
        
    }];
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60*JCLWIDTH/375;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TransferRecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[TransferRecordCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    NSDictionary *dic = self.data[indexPath.row];
    cell.trans_name.text = [NSString stringWithFormat:@"付款人:%@",dic[@"paymentTelphone"]];
    cell.was_trans_name.text = [NSString stringWithFormat:@"收款人:%@",dic[@"proceedsTelphone"]];
    
    cell.time.text = [NSString stringWithFormat:@"时间:%@",[JCLKitObj timestampSwitchTime:[dic[@"createTime"]integerValue]/1000 andFormatter:@"YYYY-MM-dd hh:mm:ss"]];
    cell.number.text = [NSString stringWithFormat:@"数量:%@",dic[@"money"]];
    cell.selectionStyle = 0;
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
