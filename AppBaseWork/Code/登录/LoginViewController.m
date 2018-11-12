//
//  LoginViewController.m
//  AppBaseWork
//
//  Created by 霍文梦 on 2018/11/12.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "LoginViewController.h"
#import "InputView.h"
#import "JCLTabBarList.h"
@interface LoginViewController ()

@property(nonatomic,strong)InputView *username;
@property(nonatomic,strong)InputView *secure;
@property(nonatomic,strong)UILabel *tap_lab;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navi.hidden = YES;
    self.table.hidden = YES;
    UIImageView *banner = [JCLKitObj JCLImage:self.view];
    banner.frame = CGRectMake(JCLWIDTH/2-35*JCLWIDTH/375, 100*JCLWIDTH/375, 70*JCLWIDTH/375, 70*JCLWIDTH/375);
    banner.image = [UIImage imageNamed:@"AppIcon"];
    [self.view addSubview:self.username];
    [self.view addSubview:self.secure];
    [self.view addSubview:self.tap_lab];
    self.view.backgroundColor = JCLRGBA(2, 7, 45, 1);
    __weak typeof(self.username) name = self.username;
    __weak typeof(self.secure) secure_data = self.secure;
    [self.tap_lab tapActionBlock:^{
        
        NSString *username = name.input_field.text;
        NSString *secure = secure_data.input_field.text;
        
        if (username.length==0) {
            
            [MBProgressHUD showError:@"请输入用户名!"];
            return;
        }
        if (secure.length==0) {
            
            [MBProgressHUD showError:@"请输入密码!"];
            return;
        }
       [MBProgressHUD showMessage:@"登录中..."];
        [JCLHttps getJson:[NSString stringWithFormat:@"http://www.baidu.com"] success:^(id obj) {
            
            [MBProgressHUD hideHUD];
            [UIApplication sharedApplication].keyWindow.rootViewController =[[JCLTabBarList alloc]init];
        }];
    }];
    // Do any additional setup after loading the view.
}
-(InputView *)username{
    
    if (!_username) {
        
        _username = [[InputView alloc]initWithFrame:CGRectMake(40*JCLWIDTH/375, JCLHEIGHT/2-100*JCLWIDTH/375, JCLWIDTH-80*JCLWIDTH/375, 65*JCLWIDTH/375)];
        _username.text_lab.text = @"用户名";
        _username.input_field.placeholder = @"请输入用户名";
        _username.backgroundColor = [UIColor clearColor];
        
    }
    
    return _username;
}
-(InputView *)secure{
    
    if (!_secure) {
        
        _secure = [[InputView alloc]initWithFrame:CGRectMake(40*JCLWIDTH/375, self.username.maxY+20*JCLWIDTH/375, JCLWIDTH-80*JCLWIDTH/375, 60*JCLWIDTH/375)];
        _secure.text_lab.text = @"密码";
        _secure.input_field.placeholder = @"请输入密码";
        _secure.input_field.secureTextEntry = YES;
        _secure.backgroundColor = [UIColor clearColor];
        
    }
    
    return _secure;
}
-(UILabel *)tap_lab{
    
    if (!_tap_lab) {
        
        _tap_lab = [JCLKitObj JCLLable:self.view font:16*JCLWIDTH/375 color:JCLRGBA(255, 255, 255, 1) alignment:1];
        _tap_lab.backgroundColor = [UIColor blueColor];
        _tap_lab.frame = CGRectMake(40*JCLWIDTH/375, self.secure.maxY+40*JCLWIDTH/375, JCLWIDTH-80*JCLWIDTH/375, 45*JCLWIDTH/375);
        _tap_lab.text = @"确定";
    }
    return _tap_lab;
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
