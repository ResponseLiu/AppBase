//
//  RedGuViewController.m
//  AppBaseWork
//
//  Created by apple on 2018/11/23.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "RedGuViewController.h"
#import "RedGuCell.h"
@interface RedGuViewController ()
@property(nonatomic,strong)NSDictionary *dic;
@property(nonatomic,strong)NSArray *array;
@end

@implementation RedGuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navi.middle.title = @"红股";
    self.table.height = JCLHEIGHT - JCLNAVI;
    self.array = @[@"搬砖分红:",@"搬砖费:",@"算力:",@"节点:",@"大节点:",@"手续费:",@"算力费:",@"节点手续费:",@"大节点手续费:",@"消费分红:",@"消费算力:",@"节点:",@"大节点:"];
    [JCLHttps getJson:[NSString stringWithFormat:@"%@incomeMoney/getBonus?uid=%@",BaseUrl,[UserData getUserInfo].uid] success:^(id obj) {

        if ([obj[@"code"]intValue]==200) {

            self.dic = obj[@"data"];
            [self.table reloadData];

        }else{

            [MBProgressHUD showError:obj[@"msg"]];
        }

    }];
    // Do any additional setup after loading the view.
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.array.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 51*JCLWIDTH/375;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RedGuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[RedGuCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.price_one.text = self.array[indexPath.row];
    NSString *price;
    switch (indexPath.row) {
        case 0:
        {
            price = [NSString stringWithFormat:@"%@",self.dic[@"bz"]];
            if ([price isKindOfClass:[NSNull class]]||[price isEqualToString:@"(null)"]) {
                
                price =@"0.00";
                
            }else{
                
                price = [NSString stringWithFormat:@"%@",self.dic[@"bz"]];
            }
            
                
        }
            break;
        case 1:
        {    price = [NSString stringWithFormat:@"%@",self.dic[@"bzf"]];
            if ([price isKindOfClass:[NSNull class]]||[price isEqualToString:@"(null)"]) {
                
                price =@"0.00";
                
            }else{
                
                price = [NSString stringWithFormat:@"%@",self.dic[@"bzf"]];
            }
            
        }
            break;
        case 2:
        {
            price = [NSString stringWithFormat:@"%@",self.dic[@"sl"]];
            if ([price isKindOfClass:[NSNull class]]||[price  isEqualToString:@"(null)"]) {
                
                price =@"0.00";
                
            }else{
                
                price = [NSString stringWithFormat:@"%@",self.dic[@"sl"]];
            }
            
        }
            break;
        case 3:
        {
            price = [NSString stringWithFormat:@"%@",self.dic[@"sj"]];
            if ([price isKindOfClass:[NSNull class]]||[price isEqualToString:@"(null)"]) {
                
                price =@"0.00";
                
            }else{
                
                price = [NSString stringWithFormat:@"%@",self.dic[@"sj"]];
            }
            
        }
            break;
        case 4:
        {
            price = [NSString stringWithFormat:@"%@",self.dic[@"mj"]];
            if ([price isKindOfClass:[NSNull class]]||[price isEqualToString:@"(null)"]) {
                
                price =@"0.00";
                
            }else{
                
                price = [NSString stringWithFormat:@"%@",self.dic[@"mj"]];
            }
        }
            break;
        case 5:
        {
            price = [NSString stringWithFormat:@"%@",self.dic[@"tjrSxf"]];
            if ([price isKindOfClass:[NSNull class]]||[price isEqualToString:@"(null)"]) {
                
                price =@"0.00";
                
            }else{
                
                price = [NSString stringWithFormat:@"%@",self.dic[@"tjrSxf"]];
            }
        }
            break;
        case 6:
        {
            price = [NSString stringWithFormat:@"%@",self.dic[@"jSxf"]];
            if ([price isKindOfClass:[NSNull class]]||[price isEqualToString:@"(null)"]) {
                
                price =@"0.00";
                
            }else{
                
                price = [NSString stringWithFormat:@"%@",self.dic[@"jSxf"]];
            }
        }
            break;
        case 7:
        {
            price = [NSString stringWithFormat:@"%@",self.dic[@"jdSxf"]];
            if ([price isKindOfClass:[NSNull class]]||[price isEqualToString:@"(null)"]) {
                
                price =@"0.00";
                
            }else{
                
                price = [NSString stringWithFormat:@"%@",self.dic[@"jdSxf"]];
            }
            
        }
            break;
        case 8:
        {
            price = [NSString stringWithFormat:@"%@",self.dic[@"djdSxf"]];
            if ([price isKindOfClass:[NSNull class]]||[price isEqualToString:@"(null)"]) {
                
                price =@"0.00";
                
            }else{
                
                price = [NSString stringWithFormat:@"%@",self.dic[@"djdSxf"]];
            }
            
        }
            break;
        case 9:
        {
            price = @"0.00";
            
        }
            break;
        case 10:
        {
            
             price = @"0.00";
        }
            break;
        case 11:
        {
             price = @"0.00";
            
        }
            break;
        case 12:
        {
            price = @"0.00";
            
        }
            break;
            
        default:
            break;
    }
    cell.price_two.text =price;
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
