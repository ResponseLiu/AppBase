//
//  PersonalCenterViewController.m
//  AppBaseWork
//
//  Created by 霍文梦 on 2018/11/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "PersonalCenterViewController.h"
#import "PersonalCell.h"
#import "ChangerPasswordViewController.h"
@interface PersonalCenterViewController ()
@property(nonatomic,strong)NSArray *data;

@end

@implementation PersonalCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.table.height = JCLHEIGHT - JCLNAVI;
    self.navi.middle.title = @"个人中心";
    self.data = @[@"修改密码",@"修改交易密码",@"实名认证"];
    
    // Do any additional setup after loading the view.
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
    cell.name_lab.text = self.data[indexPath.row];
    cell.banner.image = [UIImage imageNamed:self.data[indexPath.row]];
    cell.selectionStyle = 0;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *title = self.data[indexPath.row];
    if ([title isEqualToString:@"修改密码"]) {
        
        ChangerPasswordViewController *center = [[ChangerPasswordViewController alloc]init];
        center.type=1;
        [self.navigationController pushViewController:center animated:YES];
    }
    if ([title isEqualToString:@"修改交易密码"]) {
        
        ChangerPasswordViewController *center = [[ChangerPasswordViewController alloc]init];
        center.type=2;
        [self.navigationController pushViewController:center animated:YES];
    }
    if ([title isEqualToString:@"实名认证"]) {
        
        ChangerPasswordViewController *center = [[ChangerPasswordViewController alloc]init];
        center.type=3;
        [self.navigationController pushViewController:center animated:YES];
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
