//
//  TurnViewController.m
//  AppBaseWork
//
//  Created by 霍文梦 on 2018/11/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "TurnViewController.h"
#import "SaveHeader.h"
#import "SaveCell.h"
@interface TurnViewController ()
@property(nonatomic,strong)NSArray *left_text;
@property(nonatomic,strong)NSString *writText;
@end

@implementation TurnViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navi.middle.title = @"兑换";
    self.table.height = JCLHEIGHT - JCLNAVI;
    self.table.tableHeaderView =[self header];
    _left_text = @[[NSString stringWithFormat:@"%@数量",self.model.name]];
    self.table.tableFooterView = [self footer];
    // Do any additional setup after loading the view.
}
-(UIView *)footer{
    
    
    UIView *bg = [JCLKitObj JCLView:self.view color:JCLRGB(240, 240, 240)];
    bg.frame = CGRectMake(0, 0, JCLWIDTH, 100*JCLWIDTH/375);
    UILabel *header = [JCLKitObj JCLLable:bg font:16*JCLWIDTH/375 color:JCLRGB(255, 255, 255) alignment:1];
    header.text = @"确定";
    [header tapActionBlock:^{
        
        if (self.writText.length==0) {
            [MBProgressHUD showError:@"请输入数量!"];
            return;
        }
        [JCLHttps getJson:[NSString stringWithFormat:@"%@moneychanging/exchangeQuantity?telphone=%@&coinCode=%@",BaseUrl,[UserData getUserInfo].username,self.model.name] success:^(id obj) {
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
-(UIView *)header{
    
    SaveHeader *header = [[SaveHeader alloc]initWithFrame:CGRectMake(0, 0, JCLWIDTH, 50*JCLWIDTH/375)];
    header.backgroundColor = JCLRGB(255, 255, 255);
    header.save_num.text = [NSString stringWithFormat:@"币种:%@",self.model.name];
    header.get_num.text = [NSString stringWithFormat:@"兑换数量:%@",self.total_num];
    return header;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60*JCLWIDTH/375;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SaveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[SaveCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.input.placeholder = @"请输入数量";
    [cell.input addTarget:self action:@selector(textValueChange:) forControlEvents:UIControlEventEditingChanged];
    cell.title.text = self.left_text[indexPath.row];
    cell.selectionStyle = 0;
    cell.select_img.hidden = YES;
    return cell;
}

-(void)textValueChange:(UITextField *)Field{
    
    self.writText = Field.text;
    
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
