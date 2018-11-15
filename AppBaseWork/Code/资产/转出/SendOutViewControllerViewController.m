//
//  SendOutViewControllerViewController.m
//  AppBaseWork
//
//  Created by apple on 2018/11/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SendOutViewControllerViewController.h"

@interface SendOutViewControllerViewController ()
@property(nonatomic,strong)NSString *address;
@property(nonatomic,strong)NSString *money;
@end

@implementation SendOutViewControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navi.middle.title = @"转出";
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
        
        if (self.address.length==0) {
            [MBProgressHUD showError:@"请输入地址!"];
            return;
        }
        if (self.money.length==0) {
            [MBProgressHUD showError:@"请输入金额!"];
            return;
        }
        NSString *coinAddr;
        if ([self.model.name isEqualToString:@"HYT"]) {
            
            coinAddr = [UserData getUserInfo].hytAddr;
        }else if ([self.model.name isEqualToString:@"BTC"]){
            
             coinAddr = [UserData getUserInfo].btcAddr;
        }else if ([self.model.name isEqualToString:@"LTC"]){
            
            coinAddr = [UserData getUserInfo].ltcAddr;
        }else if ([self.model.name isEqualToString:@"ETH"]){
            
            coinAddr = [UserData getUserInfo].ethAddr;
        }else if ([self.model.name isEqualToString:@"ETC"]){
            
            coinAddr = [UserData getUserInfo].etcAddr;
        }else if ([self.model.name isEqualToString:@"XRP"]){
            
            coinAddr = [UserData getUserInfo].xrpAddr;
        }else if ([self.model.name isEqualToString:@"EOS"]){
            
            coinAddr = [UserData getUserInfo].eosAddr;
        }
        [JCLHttps getJson:[NSString stringWithFormat:@"%@app/drawwith?telphone=%@&coinAddr=%@&coinCode=%@&money=%@",BaseUrl,[UserData getUserInfo].username,coinAddr,self.model.name,self.money] success:^(id obj) {
            if ([obj[@"code"]intValue]==200) {
                
                [self.navigationController popToRootViewControllerAnimated:YES];
                [MBProgressHUD showSuccess:@"成功!"];
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
    field.placeholder =indexPath.row==0? @"收款钱包地址":@"转账金额";
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 59*JCLWIDTH/375, JCLWIDTH, 1)];
    line.backgroundColor = JCLRGBA(220, 220, 220, 1);
    [cell addSubview:line];
    cell.selectionStyle = 0;
    return cell;
}
-(void)textChange:(UITextField *)Field{
    
    
    if (Field.tag==0) {
        
        self.address = Field.text;
    }else{
        self.money = Field.text;
        
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
