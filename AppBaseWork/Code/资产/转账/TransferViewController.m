//
//  TransferViewController.m
//  AppBaseWork
//
//  Created by apple on 2018/11/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TransferViewController.h"
#import "TransferHeader.h"
#import "TransferRecordViewController.h"
@interface TransferViewController ()
@property(nonatomic,assign)CGFloat hytprice;
@property(nonatomic,strong)TransferHeader * header;
@end

@implementation TransferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navi.middle.title = @"转账";
    self.table.height = JCLHEIGHT - JCLNAVI;
    [JCLHttps getJson:[NSString stringWithFormat:@"%@sysSetting/get",BaseUrl] success:^(id obj) {
         self.hytprice = [obj[@"data"][@"hytPrice"]floatValue];
         self.table.tableHeaderView = [self Header];
         self.table.tableFooterView = [self footer];
    }];
    // Do any additional setup after loading the view.
}
-(UIView *)footer{
    
    UIView *bg = [JCLKitObj JCLView:self.view color:JCLRGB(240, 240, 240)];
    bg.frame = CGRectMake(0, 0, JCLWIDTH, 100*JCLWIDTH/375);
    UILabel *header = [JCLKitObj JCLLable:bg font:15*JCLWIDTH/375 color:JCLRGB(255, 255, 255) alignment:1];
    header.text = @"转账记录";
    header.layer.cornerRadius=3;
    [header tapActionBlock:^{
        
        TransferRecordViewController *record = [[TransferRecordViewController alloc]init];
        [self.navigationController pushViewController:record animated:YES];
        
    }];
    header.backgroundColor = JCLRGBA(60, 136, 201, 1);
    header.frame = CGRectMake(15*JCLWIDTH/375, 30*JCLWIDTH/375, JCLWIDTH/2-30*JCLWIDTH/375, 50*JCLWIDTH/375);
    
    UILabel *header1 = [JCLKitObj JCLLable:bg font:15*JCLWIDTH/375 color:JCLRGB(255, 255, 255) alignment:1];
    header1.text = @"确定转账";
    header1.layer.cornerRadius=3;
    [header1 tapActionBlock:^{
        if (self.header.input.text.length==0) {
            [MBProgressHUD showError:@"请输入地址!"];
            return;
        }
        if (self.header.hyt_money.text.length==0) {
            [MBProgressHUD showError:@"请输入金额!"];
            return;
        }
        if (self.header.code_Field.text.length==0) {
            [MBProgressHUD showError:@"请输入验证码!"];
            return;
        }
        if (self.header.tradesecure_Field.text.length==0) {
            [MBProgressHUD showError:@"请输入交易密码!"];
            return;
        }
        NSLog(@"%@",[NSString stringWithFormat:@"%@transfer/hand?paymentTelphone=%@&money=%@&proceedsCoinAddr=%@&code=%@&coinCode=HYT&tradePwd=%@",BaseUrl,[UserData getUserInfo].username,self.header.hyt_money.text,self.header.input.text,self.header.code_Field.text,self.header.tradesecure_Field.text]);
        [JCLHttps getJson:[NSString stringWithFormat:@"%@transfer/hand?paymentTelphone=%@&money=%@&proceedsCoinAddr=%@&code=%@&coinCode=HYT&tradePwd=%@",BaseUrl,[UserData getUserInfo].username,self.header.hyt_money.text,self.header.input.text,self.header.code_Field.text,self.header.tradesecure_Field.text] success:^(id obj) {
           
            if ([obj[@"code"]intValue]==200) {
                
                [self.navigationController popToRootViewControllerAnimated:YES];
            }else{
                
                [MBProgressHUD showError:obj[@"msg"]];
            }

        }];
 
    }];
    header1.backgroundColor = JCLRGBA(60, 136, 201, 1);
    header1.frame = CGRectMake(15*JCLWIDTH/375+JCLWIDTH/2, 30*JCLWIDTH/375, JCLWIDTH/2-30*JCLWIDTH/375, 50*JCLWIDTH/375);
    
    return bg;
}
-(TransferHeader *)Header{
    
    TransferHeader *header = [[TransferHeader alloc]initWithFrame:CGRectMake(0, 0, JCLWIDTH, 280*JCLWIDTH/375)];
    header.hytprice = self.hytprice;
    if (self.is_Remain==YES) {
        
        header.input.text = self.wallet_address;
        header.input.enabled = NO;
    }
    
    header.backgroundColor = JCLRGB(255, 255, 255);
    header.user_num.text = [NSString stringWithFormat:@"可转账数量:%@",_use_num];
    self.header=header;
    return header;
    
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
