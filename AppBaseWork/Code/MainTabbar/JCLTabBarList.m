//
//  TabBarController.m
//  RuiXueTuan
//
//  Created by 邢昭俊 on 14-6-14.
//  Copyright (c) 2014年 邢昭俊. All rights reserved.
//

#import "JCLTabBarList.h"

#pragma mark 1.JCLNaviBarList
@implementation JCLNaviBarList
-(void)viewDidLoad{
    
    [super viewDidLoad];
    self.delegate = self;
    
}
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    self.pushing = NO;
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    if (self.pushing==YES) {
        
        return;
        
    } else{
        
        self.pushing = YES;
        
    }
    
    if (self.viewControllers.count > 0) { viewController.hidesBottomBarWhenPushed = YES; }
    [super pushViewController:viewController animated:animated];
}
@end

#pragma mark 2.JCLTabBar
@implementation JCLTabBar
-(instancetype)init{
    if (self = [super init]){ self.alpha = 1; self.barTintColor = JCLRGBA(255, 255, 255, 1); } return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    NSInteger index = 0;
    
    for (UIView *tabBar in self.subviews) {
        if (![tabBar isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
        for (UILabel *label in tabBar.subviews) {
            if (![label isKindOfClass:[UILabel class]]) continue;
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont boldSystemFontOfSize:11];
            if ([self.items indexOfObject:self.selectedItem] == index) {
//                label.textColor = [JCLColorObj JCLSelTextCol];
            } else {
//                label.textColor = [JCLColorObj JCLTextCol];
            }
            label.width = self.height;
//            label.y -= 4,  label.width = self.height, label.height = self.height * 0.4;
        }
        index++;
    }
}
@end

#import <UIKit/UIKit.h>

@interface JCLTabBarList ()<UITabBarControllerDelegate>
@end

@implementation JCLTabBarList
- (void)viewDidLoad {
    [super viewDidLoad];
    
   
    AccountViewController *trad = [[AccountViewController alloc] init];
    [self setupChildList:trad text:@"资产" img:@"资金" selImg:@"资金s"];
    
    MarketViewController *market = [[MarketViewController alloc] init];
    [self setupChildList:market text:@"行情" img:@"行情s" selImg:@"行情"];
    
    NewsViewController *trad1 = [[NewsViewController alloc] init];
    [self setupChildList:trad1 text:@"资讯" img:@"帮助" selImg:@"帮助s"];
    
    SupMarketViewController *list1 = [[SupMarketViewController alloc] init];
    [self setupChildList:list1 text:@"商城" img:@"交易" selImg:@"交易ss"];
    
    PersonalViewController *user = [[PersonalViewController alloc] init];
    [self setupChildList:user text:@"我的" img:@"我的" selImg:@"我的s"];
    
    self.delegate = self;
    JCLTabBar *tabBar = [[JCLTabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    UIView *bg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    bg.backgroundColor = JCLRGBA(255, 255, 255, 0);
    [self.tabBar insertSubview:bg atIndex:0];
}
- (void)setupChildList:(UIViewController *)list text:(NSString *)text img:(NSString *)img selImg:(NSString *)selImg{
    list.title = text; list.tabBarItem.image = [UIImage imageNamed:img];
    list.tabBarItem.selectedImage = [UIImage imageNamed:selImg];
    JCLNaviBarList *navigation = [[JCLNaviBarList alloc] initWithRootViewController:list];
    [self addChildViewController:navigation];
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    
    [self.tabBar setNeedsLayout];
    
}
@end
