//
//  SaveAndGetViewController.m
//  AppBaseWork
//
//  Created by apple on 2018/11/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "SaveAndGetViewController.h"
#import "SaveHeader.h"
#import "SaveCell.h"
@interface SaveAndGetViewController ()
@property(nonatomic,strong)NSArray *left_text;
@property(nonatomic,assign)NSInteger select;
@property(nonatomic,strong)NSString *writText;
@end

@implementation SaveAndGetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navi.middle.title = [NSString stringWithFormat:@"%@存取",self.model.name];
    self.table.height = JCLHEIGHT - JCLNAVI;
    self.table.tableHeaderView =[self header];
    _left_text = @[@"数量",@"存储",@"提出"];
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
            [MBProgressHUD showError:@"请输入金额!"];
            return;
        }
        if (self.select==0) {
            [MBProgressHUD showError:@"请选择方式!"];
            return;
        }
        NSString *url;
        if (self.select==1) {
            
            url = [NSString stringWithFormat:@"%@storeCoin/stockpile?telphone=%@&coinCode=%@&money=%@",BaseUrl,[UserData getUserInfo].username,self.model.name,self.writText];
            
        }else if(self.select==2){
            
            url = [NSString stringWithFormat:@"%@storeCoin/extract?telphone=%@&coinCode=%@&money=%@",BaseUrl,[UserData getUserInfo].username,self.model.name,self.writText];
        }
        [JCLHttps getJson:url success:^(id obj) {
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
    header.save_num.text = [NSString stringWithFormat:@"%@",self.save_num];
    header.get_num.text = [NSString stringWithFormat:@"%@",self.get_num];
    return header;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60*JCLWIDTH/375;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SaveCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[SaveCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    [cell.input addTarget:self action:@selector(textValueChange:) forControlEvents:UIControlEventEditingChanged];
    if (indexPath.row==0) {
        cell.input.hidden = NO;
        cell.input.placeholder = @"请输入数量";
        cell.select_img.hidden = YES;
    }else{
        cell.input.hidden = YES;
        cell.select_img.hidden = NO;
    }
    cell.title.text = self.left_text[indexPath.row];
    cell.selectionStyle = 0;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    for (SaveCell *cell in tableView.visibleCells) {
        
        cell.select_img.image = [UIImage imageNamed:@"weixuanzhong"];
        
    }
    SaveCell *current = [tableView cellForRowAtIndexPath:indexPath];
    current.select_img.image = [UIImage imageNamed:@"xuanzhong"];
    self.select = indexPath.row;
    
}
-(void)textValueChange:(UITextField *)Field{
    
    self.writText = Field.text;
   
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
