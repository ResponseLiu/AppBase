//
//  CoinDetailViewController.m
//  AppBaseWork
//
//  Created by apple on 2018/11/14.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "CoinDetailViewController.h"
#import "JCLBaseMenu.h"
#import "CoinHeaderView.h"
#import "RecordCell.h"
#import "CoinActionView.h"
@interface CoinDetailViewController ()
@property(nonatomic,strong)CoinHeaderView *header;
@property(nonatomic,strong)NSMutableArray *data;
@property(nonatomic,assign)NSInteger index;
@end

@implementation CoinDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navi.middle.title = self.model.name;
    self.table.height = JCLHEIGHT - JCLNAVI-50*JCLWIDTH/375;
    self.table.tableHeaderView  = [self Header];
    CoinActionView *action = [[CoinActionView alloc]initWithFrame:CGRectMake(0, JCLHEIGHT-50*JCLWIDTH/375, JCLWIDTH, 50*JCLWIDTH/375)];
    action.name_Array = @[@"充值",@"转出",@"存取",@"转换"];
    action.tapClick = ^(NSInteger idx) {
      
        NSLog(@"%ld",idx);
        
        
    };
    [self.view addSubview:action];
    [JCLHttps getJson:[NSString stringWithFormat:@"%@app/getfund?telphone=%@",BaseUrl,[UserData getUserInfo].username] success:^(id obj) {
       
        NSLog(@"%@",obj);
        if ([obj[@"code"]intValue]==200) {
            
            if ([self->_model.name isEqualToString:@"HYT"]) {
                
                self.header.total_number.text = [NSString stringWithFormat:@"总数量:%g",[obj[@"data"][@"htyStoreNum"] doubleValue] + [obj[@"data"][@"hytNum"] doubleValue]];
                self.header.save_number.text = [NSString stringWithFormat:@"存储数量:%@",obj[@"data"][@"htyStoreNum"]];
                self.header.use_number.text = [NSString stringWithFormat:@"可提数量:%@",obj[@"data"][@"hytNum"]];
            } else if ([self->_model.name isEqualToString:@"BTC"]){
                
                
                self.header.total_number.text = [NSString stringWithFormat:@"总数量:%g",[obj[@"data"][@"btcStoreNum"] doubleValue] + [obj[@"data"][@"btcNum"] doubleValue]];
                self.header.save_number.text = [NSString stringWithFormat:@"存储数量:%@",obj[@"data"][@"btcStoreNum"]];
                self.header.use_number.text = [NSString stringWithFormat:@"可提数量:%@",obj[@"data"][@"btcNum"]];
            }else if ([self->_model.name isEqualToString:@"LTC"]){
                
                
                self.header.total_number.text = [NSString stringWithFormat:@"总数量:%g",[obj[@"data"][@"ltcStoreNum"] doubleValue] + [obj[@"data"][@"ltcNum"] doubleValue]];
                self.header.save_number.text = [NSString stringWithFormat:@"存储数量:%@",obj[@"data"][@"ltcStoreNum"]];
                self.header.use_number.text = [NSString stringWithFormat:@"可提数量:%@",obj[@"data"][@"ltcNum"]];
            }else if ([self->_model.name isEqualToString:@"ETH"]){
                
                
                self.header.total_number.text = [NSString stringWithFormat:@"总数量:%g",[obj[@"data"][@"ethStoreNum"] doubleValue] + [obj[@"data"][@"ethNum"] doubleValue]];
                self.header.save_number.text = [NSString stringWithFormat:@"存储数量:%@",obj[@"data"][@"ethStoreNum"]];
                self.header.use_number.text = [NSString stringWithFormat:@"可提数量:%@",obj[@"data"][@"ethNum"]];
            }else if ([self->_model.name isEqualToString:@"ETC"]){
                
                
                self.header.total_number.text = [NSString stringWithFormat:@"总数量:%g",[obj[@"data"][@"etcStoreNum"] doubleValue] + [obj[@"data"][@"etcNum"] doubleValue]];
                self.header.save_number.text = [NSString stringWithFormat:@"存储数量:%@",obj[@"data"][@"etcStoreNum"]];
                self.header.use_number.text = [NSString stringWithFormat:@"可提数量:%@",obj[@"data"][@"etcNum"]];
            }else if ([self->_model.name isEqualToString:@"XRP"]){
                
                
                self.header.total_number.text = [NSString stringWithFormat:@"总数量:%g",[obj[@"data"][@"xrpStoreNum"] doubleValue] + [obj[@"data"][@"xrpNum"] doubleValue]];
                self.header.save_number.text = [NSString stringWithFormat:@"存储数量:%@",obj[@"data"][@"xrpStoreNum"]];
                self.header.use_number.text = [NSString stringWithFormat:@"可提数量:%@",obj[@"data"][@"xrpNum"]];
            }else if ([self->_model.name isEqualToString:@"EOS"]){
                
                
                self.header.total_number.text = [NSString stringWithFormat:@"总数量:%g",[obj[@"data"][@"eosStoreNum"] doubleValue] + [obj[@"data"][@"eosNum"] doubleValue]];
                self.header.save_number.text = [NSString stringWithFormat:@"存储数量:%@",obj[@"data"][@"eosStoreNum"]];
                self.header.use_number.text = [NSString stringWithFormat:@"可提数量:%@",obj[@"data"][@"eosNum"]];
            }
            
           
            
        }
        
    }];
    // Do any additional setup after loading the view.
}
-(UIView *)Header{
    
    UIView *contain = [JCLKitObj JCLView:self.view   color:JCLRGB(255, 255, 255)];
    contain.frame = CGRectMake(0, 0, JCLWIDTH, 90*JCLWIDTH/375);
    CoinHeaderView *header = [[CoinHeaderView alloc]initWithFrame:CGRectMake(0, 0, JCLWIDTH, 50*JCLWIDTH/375)];
    [contain addSubview:header];
    self.header = header;
    
    JCLBaseMenu *menu = [[JCLBaseMenu alloc]initWithFrame:CGRectMake(0, 50*JCLWIDTH/375, JCLWIDTH, 40*JCLWIDTH/375)]; [contain addSubview:menu];
    menu.style = MenuStyleBGLine;
    menu.isAction = YES;
    menu.arr = @[@"充提记录", @"存取记录",@"兑换记录"];
    menu.tapActionBlock = ^(NSInteger idx){
        self.index = idx;
        self.data = [NSMutableArray array];
        NSString *url;
        if (idx==0) {
            url = [NSString stringWithFormat:@"%@incomeMoney/stockpileWater?telphone=%@&coinCode=%@&status=%d&page=1&limit=10000",BaseUrl,[UserData getUserInfo].username,self.model.name,7];
           
        }else if (idx==1){
            
             url = [NSString stringWithFormat:@"%@incomeMoney/stockpileWater?telphone=%@&coinCode=%@&status=%d&page=1&limit=10000",BaseUrl,[UserData getUserInfo].username,self.model.name,3];
            
        }else{
             url = [NSString stringWithFormat:@"%@incomeMoney/stockpileWater?telphone=%@&coinCode=%@&status=%d&page=1&limit=10000",BaseUrl,[UserData getUserInfo].username,self.model.name,8];
        }
        [MBProgressHUD showMessage:@"加载中..."];
        [JCLHttps getJson:url success:^(id obj) {
           
            [MBProgressHUD hideHUD];
            if ([obj[@"code"]intValue]==200) {
                
                for (NSDictionary *dic in obj[@"data"][@"data"]) {
                    
                    [self.data addObject:dic];
                }
            
            }else{
                [MBProgressHUD showError:obj[@"msg"]];
            }
            [self.table reloadData];
            NSLog(@"%@",obj[@"msg"]);
            
            NSLog(@"%@",obj);
        }];
        
    };
    
    return contain;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80*JCLWIDTH/375;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RecordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[RecordCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
        
    }
    cell.name.hidden = NO;
    cell.number.hidden = NO;
    cell.name.textColor = JCLRGB(30, 30, 30);
    NSDictionary *dic = self.data[indexPath.row];
    if (self.index==1) {
        
        cell.kind.text = [dic[@"type"]intValue]==1?@"取出":@"存储";
        cell.time.text = [JCLKitObj timestampSwitchTime:[dic[@"createTime"]integerValue]/1000 andFormatter:@"YYYY-MM-dd hh:mm:ss"];
        cell.name.text = dic[@"coinCode"];
        cell.number.text = [NSString stringWithFormat:@"数量:%@",dic[@"money"]];
    } else if (self.index==0){
        
        cell.kind.text = [dic[@"type"]intValue]==1?@"充值":@"提取";
        cell.time.text = [JCLKitObj timestampSwitchTime:[dic[@"createTime"]integerValue]/1000 andFormatter:@"YYYY-MM-dd hh:mm:ss"];
        if ([dic[@"status"]intValue]==0) {
            
            cell.name.text = @"审核中";
            cell.name.textColor = [UIColor redColor];
            
        }else if ([dic[@"status"]intValue]==1) {
            
             cell.name.text = @"通过";
             cell.name.textColor = [UIColor greenColor];
            
        }else if ([dic[@"status"]intValue]==2) {
            
             cell.name.text = @"未通过";
             cell.name.textColor = [UIColor redColor];
        }
       
        cell.number.text = [NSString stringWithFormat:@"数量:%@",dic[@"money"]];
        
    }else if (self.index==2){
        
        cell.kind.text = [NSString stringWithFormat:@"%@ %@兑换%@ %@",dic[@"coinCode"],dic[@"money"],dic[@"exchangeCoinCode"],dic[@"exchangeMoney"]];
        cell.time.text = [JCLKitObj timestampSwitchTime:[dic[@"createTime"]integerValue]/1000 andFormatter:@"YYYY-MM-dd hh:mm:ss"];
        cell.name.hidden = YES;
        cell.number.hidden = YES;
        
        
    }
   
    cell.selectionStyle = 0;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    
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
