//
//  TransferHeader.m
//  AppBaseWork
//
//  Created by apple on 2018/11/16.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TransferHeader.h"

@implementation TransferHeader

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        self.type=0;
        _user_num = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(30, 30, 30, 1) alignment:0];
        _user_num.text = @"可转账数量:0.00";
        _user_num.frame = CGRectMake(15*JCLWIDTH/375, 0, 300*JCLWIDTH/375, 50*JCLWIDTH/375);
        UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 50*JCLWIDTH/375, JCLWIDTH, 1)];
        line1.backgroundColor = JCLRGBA(220, 220, 220, 1);
        [self addSubview:line1];
        
        UILabel *wallet = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(30, 30, 30, 1) alignment:0];
        wallet.frame = CGRectMake(15*JCLWIDTH/375, line1.maxY, 50*JCLWIDTH/375, 50*JCLWIDTH/375);
        wallet.text  = @"钱包:";
        
        _input= [JCLKitObj JCLField:self font:16*JCLWIDTH/375 color:JCLRGB(50, 50, 50) delegate:nil];
        _input.placeholder = @"请输入地址";
        _input.frame = CGRectMake(wallet.maxX+5*JCLWIDTH/375, line1.maxY, JCLWIDTH-wallet.maxX, 50*JCLWIDTH/375);
        
        UIView *line2 = [[UIView alloc]initWithFrame:CGRectMake(0, wallet.maxY, JCLWIDTH, 1)];
        line2.backgroundColor = JCLRGBA(220, 220, 220, 1);
        [self addSubview:line2];
        
        
        
        _rmb_lab = [JCLKitObj JCLLable:self font:10*JCLWIDTH/375 color:JCLRGBA(255, 255, 255, 1) alignment:1];
        _rmb_lab.text = @"人民币";
        _rmb_lab.frame = CGRectMake(15*JCLWIDTH/375, line2.maxY+10*JCLWIDTH/375, 50*JCLWIDTH/375, 25*JCLWIDTH/375);
        _rmb_lab.backgroundColor = JCLRGBA(103, 182, 55, 1);
        _rmb_lab.layer.cornerRadius = 3*JCLWIDTH/375;
        [_rmb_lab tapActionBlock:^{
           
            self.type=0;
            _hyt_money.placeholder = @"请输入RMB金额";
            _red_lab.text = @"请输入RMB金额";
            _hyt_lab.backgroundColor = JCLRGBA(230, 230, 230, 1);
            _rmb_lab.backgroundColor = JCLRGBA(103, 182, 55, 1);
            
        }];
        
        _hyt_lab = [JCLKitObj JCLLable:self font:10*JCLWIDTH/375 color:JCLRGBA(255, 255, 255, 1) alignment:1];
        _hyt_lab.text = @"HYT";
        _hyt_lab.frame = CGRectMake(15*JCLWIDTH/375, _rmb_lab.maxY+5*JCLWIDTH/375, 50*JCLWIDTH/375, 25*JCLWIDTH/375);
        _hyt_lab.backgroundColor = JCLRGBA(230, 230, 230, 1);
        _hyt_lab.layer.cornerRadius = 3*JCLWIDTH/375;
        [_hyt_lab tapActionBlock:^{
           
            self.type=1;
            _rmb_lab.backgroundColor = JCLRGBA(230, 230, 230, 1);
            _hyt_money.placeholder = @"请输入HYT金额";
            _red_lab.text = @"请输入HYT金额";
            _hyt_lab.backgroundColor = JCLRGBA(103, 182, 55, 1);
            
        }];
        
        _hyt_money= [JCLKitObj JCLField:self font:13*JCLWIDTH/375 color:JCLRGB(50, 50, 50) delegate:nil];
        _hyt_money.placeholder = @"请输入RMB金额";
        _hyt_money.frame = CGRectMake(_rmb_lab.maxX+15*JCLWIDTH/375, line2.maxY+2*JCLWIDTH/375, JCLWIDTH-_rmb_lab.maxX, 40*JCLWIDTH/375);
         [_hyt_money addTarget:self action:@selector(textValueChange:) forControlEvents:UIControlEventEditingChanged];
        
        _red_lab = [JCLKitObj JCLLable:self font:12*JCLWIDTH/375 color:[UIColor redColor] alignment:0];
        _red_lab.text = @"请输入RMB金额";
        _red_lab.frame = CGRectMake(_rmb_lab.maxX+15*JCLWIDTH/375, _rmb_lab.maxY+5*JCLWIDTH/375, 150*JCLWIDTH/375, 30*JCLWIDTH/375);

        UIView *line3 = [[UIView alloc]initWithFrame:CGRectMake(0, _red_lab.maxY+5*JCLWIDTH/375, JCLWIDTH, 1)];
        line3.backgroundColor = JCLRGBA(220, 220, 220, 1);
        [self addSubview:line3];
        
        
        
        UILabel *code = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(30, 30, 30, 1) alignment:0];
        code.frame = CGRectMake(15*JCLWIDTH/375, line3.maxY, 60*JCLWIDTH/375, 50*JCLWIDTH/375);
        code.text  = @"验证码:";
        
        _code_Field= [JCLKitObj JCLField:self font:16*JCLWIDTH/375 color:JCLRGB(50, 50, 50) delegate:nil];
        _code_Field.placeholder = @"请输入验证码";
        _code_Field.frame = CGRectMake(code.maxX+5*JCLWIDTH/375, line3.maxY, JCLWIDTH-code.maxX-130*JCLWIDTH/375, 50*JCLWIDTH/375);
        
        UILabel *send_code = [JCLKitObj JCLLable:self font:13*JCLWIDTH/375 color:JCLRGBA(255, 255, 255, 1) alignment:1];
        send_code.frame = CGRectMake(_code_Field.maxX+15*JCLWIDTH/375, line3.maxY+5*JCLWIDTH/375, 80*JCLWIDTH/375, 40*JCLWIDTH/375);
        send_code.text  = @"发送验证码";
        send_code.backgroundColor = JCLRGBA(103, 182, 55, 1);
        send_code.layer.cornerRadius = 5;
        [send_code tapActionBlock:^{
           
            [JCLHttps getJson:[NSString stringWithFormat:@"%@transfer/getTransferCodeMsg?paymentTelphone=%@",BaseUrl,[UserData getUserInfo].username] success:^(id obj) {
               
                if ([obj[@"code"]intValue]==200) {
                    
                    [MBProgressHUD showSuccess:obj[@"msg"]];
                }else{
                    
                    [MBProgressHUD showError:obj[@"msg"]];
                    
                }
                
            }];
            
        }];
        UIView *line4 = [[UIView alloc]initWithFrame:CGRectMake(0, _code_Field.maxY, JCLWIDTH, 1)];
        line4.backgroundColor = JCLRGBA(220, 220, 220, 1);
        [self addSubview:line4];
        
        
        UILabel *trade_Secure = [JCLKitObj JCLLable:self font:16*JCLWIDTH/375 color:JCLRGBA(30, 30, 30, 1) alignment:0];
        trade_Secure.frame = CGRectMake(15*JCLWIDTH/375, line4.maxY, 90*JCLWIDTH/375, 50*JCLWIDTH/375);
        trade_Secure.text  = @"交易密码:";
        
        _tradesecure_Field= [JCLKitObj JCLField:self font:16*JCLWIDTH/375 color:JCLRGB(50, 50, 50) delegate:nil];
        _tradesecure_Field.placeholder = @"请输入交易密码";
        _tradesecure_Field.frame = CGRectMake(trade_Secure.maxX+5*JCLWIDTH/375, line4.maxY, JCLWIDTH-trade_Secure.maxX, 50*JCLWIDTH/375);
        _tradesecure_Field.secureTextEntry = YES;
        UIView *line5 = [[UIView alloc]initWithFrame:CGRectMake(0, trade_Secure.maxY, JCLWIDTH, 1)];
        line5.backgroundColor = JCLRGBA(220, 220, 220, 1);
        [self addSubview:line5];
        
    }
    
    return self;
}
-(void)textValueChange:(UITextField *)Field{
    
    if (self.type==0) {
        
        self.red_lab.text = [NSString stringWithFormat:@"≈%.2fHYT(约等值HYT)",Field.text.floatValue/self.hytprice/7];
        
    }else{
        
        self.red_lab.text = [NSString stringWithFormat:@"≈%.2f人民币(约等值RMB)",self.hytprice*7*Field.text.floatValue];
        
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
