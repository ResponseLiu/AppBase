//
//  ChargeViewController.m
//  AppBaseWork
//
//  Created by apple on 2018/11/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ChargeViewController.h"

@interface ChargeViewController ()
@property(nonatomic,strong)NSString *number;
@property(nonatomic,strong)NSString *bz;
@end

@implementation ChargeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navi.middle.title= @"充值";
    self.table.tableHeaderView = [self header];
    self.table.tableFooterView = [self footer];
     self.table.height = JCLHEIGHT - JCLNAVI;
    // Do any additional setup after loading the view.
}
-(UIView *)header{
    
    UILabel *header = [JCLKitObj JCLLable:self.view font:16*JCLWIDTH/375 color:JCLRGB(100, 100, 100) alignment:1];
    header.text = _model.name;
    header.backgroundColor = JCLRGB(240, 240, 240);
    header.frame = CGRectMake(0, 0, JCLWIDTH, 50*JCLWIDTH/375);
    
    return header;
}
-(UIView *)footer{
    
    
    UIView *bg = [JCLKitObj JCLView:self.view color:JCLRGB(240, 240, 240)];
    bg.frame = CGRectMake(0, 0, JCLWIDTH, 100*JCLWIDTH/375);
    UILabel *header = [JCLKitObj JCLLable:bg font:16*JCLWIDTH/375 color:JCLRGB(255, 255, 255) alignment:1];
    header.text = @"确定";
    [header tapActionBlock:^{
       
        if (self.number.length==0) {
            [MBProgressHUD showError:@"请输入数量!"];
            return;
        }
        NSString *url;
        if ([self.model.name isEqualToString:@"BTC"]) {
            
            url = [NSString stringWithFormat:@"%@app/pay?telphone=%@&coinAddr=%@&coinCode=%@&txid=%@&money=%@",BaseUrl,[UserData getUserInfo].username,[UserData getUserInfo].btcAddr,self.model.name,self.bz,self.number];
        }else if ([self.model.name isEqualToString:@"ETH"]){
            
            url = [NSString stringWithFormat:@"%@app/pay?telphone=%@&coinAddr=%@&coinCode=%@&txid=%@&money=%@",BaseUrl,[UserData getUserInfo].username,[UserData getUserInfo].ethAddr,self.model.name,self.bz,self.number];
        }
        [JCLHttps getJson:url success:^(id obj) {
            if ([obj[@"code"]intValue]==200) {
                [MBProgressHUD showSuccess:@"成功!"];
                [self.navigationController popToRootViewControllerAnimated:YES];
            }else{
                
                [MBProgressHUD showError:obj[@"msg"]];
                
            }
        }];
    }];
    header.backgroundColor = JCLRGBA(60, 136, 201, 1);
    header.frame = CGRectMake(40*JCLWIDTH/375, 30*JCLWIDTH/375, JCLWIDTH-80*JCLWIDTH/375, 50*JCLWIDTH/375);
    
    return bg;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60*JCLWIDTH/375;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    UITextField *field = [JCLKitObj JCLField:cell font:16*JCLWIDTH/375 color:JCLRGB(50, 50, 50) delegate:nil];
    field.tag = indexPath.row;
    [field addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];
    field.frame = CGRectMake(15*JCLWIDTH/375, 0, JCLWIDTH-15*JCLWIDTH/375, 59*JCLWIDTH/375);
    field.placeholder =indexPath.row==0? @"数量":@"备注";
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 59*JCLWIDTH/375, JCLWIDTH, 1)];
    line.backgroundColor = JCLRGBA(220, 220, 220, 1);
    [cell addSubview:line];
    cell.selectionStyle = 0;
    return cell;
}
-(void)textChange:(UITextField *)Field{
    
    
    if (Field.tag==0) {
        
        self.number = Field.text;
    }else{
        self.bz = Field.text;
        
    }
    
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
