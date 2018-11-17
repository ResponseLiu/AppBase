//
//  PersonalViewController.m
//  AppBaseWork
//
//  Created by apple on 2018/11/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PersonalViewController.h"
#import "PersonalCell.h"
#import "PersonalHeader.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "PersonalCenterViewController.h"
#import "BusinessPartnerViewController.h"
#import "WebViewController.h"
#import "TGViewController.h"
@interface PersonalViewController ()
@property(nonatomic,strong)NSArray *data;
@end

@implementation PersonalViewController


- (void)viewDidLoad {
    [super viewDidLoad];
     self.navi.middle.title = @"我的";
     self.navi.left.hidden = YES;
     self.data = @[@"个人中心",@"股权资产",@"信用评分",@"小程序",@"推广",@"商业伙伴",@"设置",@"帮助中心",@"关于我们",@"退出登录"];
     self.table.tableHeaderView = [self Header];
//     self.table.tableFooterView = [self footer];
    // Do any additional setup after loading the view.
}
//-(UIView *)footer{
//
//
//    UIView *bg = [JCLKitObj JCLView:self.view color:JCLRGB(240, 240, 240)];
//    bg.frame = CGRectMake(0, 0, JCLWIDTH, 100*JCLWIDTH/375);
//    UILabel *header = [JCLKitObj JCLLable:bg font:16*JCLWIDTH/375 color:JCLRGB(255, 255, 255) alignment:1];
//    header.text = @"退出登录";
//    [header tapActionBlock:^{
//
//
//    }];
//    header.backgroundColor = JCLRGBA(60, 136, 201, 1);
//    header.frame = CGRectMake(40*JCLWIDTH/375, 30*JCLWIDTH/375, JCLWIDTH-80*JCLWIDTH/375, 50*JCLWIDTH/375);
//
//    return bg;
//}
-(PersonalHeader *)Header{
    
    PersonalHeader *Header=[[PersonalHeader alloc]initWithFrame:CGRectMake(0, 0, JCLWIDTH, 170*JCLWIDTH/375)];
    return Header;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 55*JCLWIDTH/375;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PersonalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[PersonalCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.accessoryType = 1;
    cell.name_lab.text = self.data[indexPath.row];
    cell.banner.image = [UIImage imageNamed:self.data[indexPath.row]];
    cell.selectionStyle = 0;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *title = self.data[indexPath.row];
    if ([title isEqualToString:@"推广"]) {
        TGViewController*center = [[TGViewController alloc]init];
        [self.navigationController pushViewController:center animated:YES];
    }
    if ([title isEqualToString:@"关于我们"]) {
         WebViewController*center = [[WebViewController alloc]init];
         center.url = @"http://hytzfl.vip/doc/whitepaper.html";
         center.name = @"关于我们";
         [self.navigationController pushViewController:center animated:YES];
    }
    if ([title isEqualToString:@"个人中心"]) {
        
        PersonalCenterViewController *center = [[PersonalCenterViewController alloc]init];
        [self.navigationController pushViewController:center animated:YES];
    }
    if ([title isEqualToString:@"商业伙伴"]) {
        
        BusinessPartnerViewController *center = [[BusinessPartnerViewController alloc]init];
        [self.navigationController pushViewController:center animated:YES];
    }
    if ([title isEqualToString:@"退出登录"]) {
        
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"友情提示" message:@"您是否要退出账号."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ac1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                    handler:^(UIAlertAction * action) {
                                                        
                                                        PreWrite(nil, @"single");
                                                        NSFileManager *manager = [NSFileManager defaultManager]; [manager removeItemAtPath:CachesFile(User) error:NULL];
  
                                                        AppDelegate *del =[UIApplication sharedApplication].delegate;
                                                        del.window.rootViewController = [[LoginViewController alloc]init];
                                                       
                                                    }];
        UIAlertAction *ac2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) { }];
        [alert addAction:ac2];[alert addAction:ac1];
        [self presentViewController:alert animated:YES completion:nil];
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
