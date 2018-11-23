//
//  BusinessPartnerViewController.m
//  AppBaseWork
//
//  Created by 霍文梦 on 2018/11/15.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "BusinessPartnerViewController.h"
#import "BusinessCell.h"
#import "BusinessHeader.h"
@interface BusinessPartnerViewController ()
@property(nonatomic,strong)NSArray *data;
@property(nonatomic,strong)BusinessHeader *header;
@end

@implementation BusinessPartnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navi.middle.title = @"商业伙伴";
    self.table.height = JCLHEIGHT - JCLNAVI;
    self.table.tableHeaderView = [self Header];
    [JCLHttps getJson:[NSString stringWithFormat:@"%@app/getTuiGuangNum?telPhone=%@",BaseUrl,[UserData getUserInfo].username] success:^(id obj) {
       
        if ([obj[@"code"]intValue]==200) {
            
            self.header.recommand_num.text = [NSString stringWithFormat:@"推荐人数:%@",obj[@"data"][@"tjrs"]];
             self.header.qualified_num.text = [NSString stringWithFormat:@"推荐合格人数:%@",obj[@"data"][@"tjjgrs"]];
             self.header.team_num.text = [NSString stringWithFormat:@"团队人数:%@",obj[@"data"][@"xjrs"]];
             self.header.team_numQualifed_num.text = [NSString stringWithFormat:@"团队合格人数:%@",obj[@"data"][@"xjjgrs"]];
            
        }else{
            
            [MBProgressHUD showError:obj[@"msg"]];
        }
        
    }];
    [JCLHttps getJson:[NSString stringWithFormat:@"%@app/getRecommendUsers?telPhone=%@",BaseUrl,[UserData getUserInfo].username] success:^(id obj) {
        NSLog(@"%@",obj);
        if ([obj[@"code"]intValue]==200) {
            
            self.data = obj[@"data"];
            [self.table reloadData];
            
        }else{
            
            [MBProgressHUD showError:obj[@"msg"]];
        }

    }];
    // Do any additional setup after loading the view.
}
-(BusinessHeader *)Header{
    
    BusinessHeader *header = [[BusinessHeader alloc]initWithFrame:CGRectMake(0, 0, JCLWIDTH, 80*JCLWIDTH/375)];
    header.backgroundColor = JCLRGB(255, 255, 255);
    self.header = header;
    return header;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.data.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60*JCLWIDTH/375;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    BusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[BusinessCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    NSDictionary *dic = self.data[indexPath.row];
    cell.account_lab.text = [NSString stringWithFormat:@"%@",dic[@"telphone"]];
    cell.name_lab.text = [NSString stringWithFormat:@"%@",dic[@"realName"]];
    cell.status_lab.text = [dic[@"qualified"]intValue]==1?@"合格":@"不合格";
    cell.selectionStyle = 0;
    return cell;
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
