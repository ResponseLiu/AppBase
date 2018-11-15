//
//  ChangerPasswordViewController.m
//  AppBaseWork
//
//  Created by 霍文梦 on 2018/11/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ChangerPasswordViewController.h"

@interface ChangerPasswordViewController ()
@property(nonatomic,strong)NSArray *placeholder;
@property(nonatomic,strong)NSString *old_password;
@property(nonatomic,strong)NSString *get_password;
@property(nonatomic,strong)NSString *sure_password;
@end

@implementation ChangerPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.table.height = JCLHEIGHT - JCLNAVI;
    if (self.type==1) {
        
        self.navi.middle.title = @"修改密码";
        self.placeholder  = @[@"请输入旧密码",@"请输入新密码",@"请输入确认密码"];
        
    }else if (self.type==2){
        
        self.navi.middle.title = @"修改交易密码";
        self.placeholder  = @[@"请输入旧密码",@"请输入新密码",@"请输入确认密码"];
        
    }else{
        
        self.navi.middle.title = @"实名认证";
        self.placeholder  = @[@"姓名",@"身份证号"];
    }
    
    self.table.tableFooterView = [self footer];
    // Do any additional setup after loading the view.
}
-(UIView *)footer{
    
    
    UIView *bg = [JCLKitObj JCLView:self.view color:JCLRGB(240, 240, 240)];
    bg.frame = CGRectMake(0, 0, JCLWIDTH, 100*JCLWIDTH/375);
    UILabel *header = [JCLKitObj JCLLable:bg font:16*JCLWIDTH/375 color:JCLRGB(255, 255, 255) alignment:1];
    header.text = @"确定";
    [header tapActionBlock:^{
        
        
        NSString *url;
        if (self.type==1) {
            
            if (self.old_password.length==0) {
                [MBProgressHUD showError:@"请输入旧密码!"];
                return;
            }
            if (self.get_password.length==0) {
                [MBProgressHUD showError:@"请输入新密码!"];
                return;
            }
            if (self.sure_password.length==0) {
                [MBProgressHUD showError:@"请输入确认密码!"];
                return;
            }
             url = [NSString stringWithFormat:@"%@app/updatePassword?telPhone=%@&oldPassword=%@&newPassword=%@&confirmPassword=%@",BaseUrl,[UserData getUserInfo].username,self.old_password,self.get_password,self.sure_password];
        }else if (self.type==2){
            
            if (self.old_password.length==0) {
                [MBProgressHUD showError:@"请输入旧密码!"];
                return;
            }
            if (self.get_password.length==0) {
                [MBProgressHUD showError:@"请输入新密码!"];
                return;
            }
            if (self.sure_password.length==0) {
                [MBProgressHUD showError:@"请输入确认密码!"];
                return;
            }
            url = [NSString stringWithFormat:@"%@app/updateTradePassword?telPhone=%@&oldPassword=%@&newPassword=%@&confirmPassword=%@",BaseUrl,[UserData getUserInfo].username,self.old_password,self.get_password,self.sure_password];
        }else{
            if (self.old_password.length==0) {
                [MBProgressHUD showError:@"请输入姓名!"];
                return;
            }
            if (self.get_password.length==0) {
                [MBProgressHUD showError:@"请输入身份证号码!"];
                return;
            }
           
             url = [NSString stringWithFormat:@"%@app/updateBaseInfo?telPhone=%@&realName=%@&idNo=%@",BaseUrl,[UserData getUserInfo].username,self.old_password,self.get_password];
            
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
    
    return self.placeholder.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 55*JCLWIDTH/375;
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
    if (self.type!=3) {
        
        field.secureTextEntry = YES;
    }
    
    field.placeholder =self.placeholder[indexPath.row];
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 59*JCLWIDTH/375, JCLWIDTH, 1)];
    line.backgroundColor = JCLRGBA(220, 220, 220, 1);
    [cell addSubview:line];
    cell.selectionStyle = 0;
    return cell;
}
-(void)textChange:(UITextField *)Field{
    
    if (Field.tag==0) {
        
        self.old_password = Field.text;
        
    }else if (Field.tag==1){
        
         self.get_password = Field.text;
        
    }else{
        
         self.sure_password = Field.text;
        
    }
   
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
