//
//  AccountViewController.m
//  AppBaseWork
//
//  Created by apple on 2018/11/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "AccountViewController.h"
#import "AccountHeaderView.h"
#import "HYTCoinCell.h"
#import "ScanLifeViewController.h"
#import "AccountModel.h"
#import "WebViewController.h"
#import "CoinDetailViewController.h"
#import "TurnViewController.h"
#import "CodeViewController.h"
@interface AccountViewController ()
@property(nonatomic,strong)AccountHeaderView *header;
@property(nonatomic,strong)NSArray *data;
@property(nonatomic,strong)NSMutableArray *price_Data;
@property(nonatomic,strong)NSMutableArray *final_data;
@end

@implementation AccountViewController
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:YES];
   
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navi.middle.title = @"资产";
    self.navi.left.hidden = YES;
    self.table.tableHeaderView = [self Header];
    [self loadData];
    [self.table JCLHeaderBlock:^{
       
         [self loadData];
        
    }];
    // Do any additional setup after loading the view.
}
-(void)loadData{
    
    [MBProgressHUD showMessage:@"加载中..."];
    [JCLHttps getJson:[NSString stringWithFormat:@"%@app/getfund?telphone=%@",BaseUrl,[UserData getUserInfo].telphone] success:^(id obj) {
        NSLog(@"%@",obj);
       double htyStoreNum = [obj[@"data"][@"htyStoreNum"] doubleValue];
       double hytNum = [obj[@"data"][@"hytNum"] doubleValue];
       self.header.total_money.text = [NSString stringWithFormat:@"总资产:%g", (hytNum+htyStoreNum) ];
        
        self.header.not_useMoney.text = [NSString stringWithFormat:@"冻结资产:%@",obj[@"data"][@"hytFrozenNum"]];
        self.data = @[obj[@"data"][@"hytNum"],obj[@"data"][@"btcNum"],obj[@"data"][@"ltcNum"],obj[@"data"][@"ethNum"],obj[@"data"][@"etcNum"],obj[@"data"][@"xrpNum"],obj[@"data"][@"eosNum"]];
        NSArray *name_array = @[@"HYT",@"BTC",@"LTC",@"ETH",@"ETC",@"XRP",@"EOS"];
        self->_price_Data = [NSMutableArray array];
        self->_final_data = [NSMutableArray array];
        //HYT价格
        [JCLHttps getJson:[NSString stringWithFormat:@"%@sysSetting/get",BaseUrl] success:^(id obj) {
           
            if ([obj[@"code"]intValue]==200) {
                
                [self->_price_Data addObject:obj[@"data"][@"hytPrice"]];
                
                [JCLHttps getJson:@"http://47.75.169.147/fxjz/huobi/merged?symbol=btcusdt&AccessKeyId=9a6e6d94-7d1ed76e-376e6d3a-32dee" success:^(id obj) {
                   
                    [self->_price_Data addObject:obj[@"tick"][@"close"]];
                    
                    [JCLHttps getJson:@"http://47.75.169.147/fxjz/huobi/merged?symbol=ltcusdt&AccessKeyId=9a6e6d94-7d1ed76e-376e6d3a-32dee" success:^(id obj) {
                        
                        [self->_price_Data addObject:obj[@"tick"][@"close"]];
                        
                        [JCLHttps getJson:@"http://47.75.169.147/fxjz/huobi/merged?symbol=ethusdt&AccessKeyId=9a6e6d94-7d1ed76e-376e6d3a-32dee" success:^(id obj) {
                            
                            [self->_price_Data addObject:obj[@"tick"][@"close"]];
                            
                            [JCLHttps getJson:@"http://47.75.169.147/fxjz/huobi/merged?symbol=etcusdt&AccessKeyId=9a6e6d94-7d1ed76e-376e6d3a-32dee" success:^(id obj) {
                                
                                [self->_price_Data addObject:obj[@"tick"][@"close"]];
                                
                                
                                [JCLHttps getJson:@"http://47.75.169.147/fxjz/huobi/merged?symbol=xrpusdt&AccessKeyId=9a6e6d94-7d1ed76e-376e6d3a-32dee" success:^(id obj) {
                                    
                                    [self->_price_Data addObject:obj[@"tick"][@"close"]];
                                   
                                    [JCLHttps getJson:@"http://47.75.169.147/fxjz/huobi/merged?symbol=eosusdt&AccessKeyId=9a6e6d94-7d1ed76e-376e6d3a-32dee" success:^(id obj) {
                                        
                                        [self->_price_Data addObject:obj[@"tick"][@"close"]];
                                   
                                        for (int i=0; i<self->_price_Data.count; i++) {
                                            
                                            double number = [self.data[i] doubleValue];
                                            double price = [self->_price_Data[i]doubleValue];
                                            NSString *name = name_array[i];
                                            AccountModel *model = [[AccountModel alloc]init];
                                            model.number = number;
                                            model.price = price;
                                            model.name = name;
                                            [self->_final_data addObject:model];
                                        
                                        }
                                        [self.table reloadData];
                                        [self.table.mj_header endRefreshing];
                                        [MBProgressHUD hideHUD];
 
                                    }];

                                }];

                            }];
                        }];
   
                    }];
    
                }];

            }
        }];
        
    }];
}
-(AccountHeaderView *)Header{
    
    AccountHeaderView *Header = [[AccountHeaderView alloc]initWithFrame:CGRectMake(0, 0, JCLWIDTH, 200*JCLWIDTH/375)];
    Header.backgroundColor = JCLRGBA(60, 136, 201, 1);
    self.header = Header;
    [Header.scan_img tapActionBlock:^{
       
        ScanLifeViewController *scan = [[ScanLifeViewController alloc]init];
        scan.model = self.final_data[0];
        [self.navigationController pushViewController:scan animated:YES];
    }];
    [Header.code_img tapActionBlock:^{
        
        CodeViewController *scan = [[CodeViewController alloc]init];
        [self.navigationController pushViewController:scan animated:YES];
    }];
    return Header;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return self.data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    return 80*JCLWIDTH/375;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    HYTCoinCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[HYTCoinCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        
    }
    cell.model = self.final_data[indexPath.row];
    cell.selectionStyle = 0;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CoinDetailViewController *detail = [[CoinDetailViewController alloc]init];
    detail.model = self.final_data[indexPath.row];
    [self.navigationController pushViewController:detail animated:YES];
    
    
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
