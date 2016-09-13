//
//  DuoWanTabBarController.m
//  BaseProject
//
//  Created by 潘鹏 on 15/11/5.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "DuoWanTabBarController.h"
#import "HeroViewController.h"
#import "SearchViewController.h"
#import "BaiKeViewController.h"

@interface DuoWanTabBarController ()
@end
@implementation DuoWanTabBarController
+ (DuoWanTabBarController *)standardInstance{
    static DuoWanTabBarController *vc= nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [DuoWanTabBarController new];
    });
    return vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//取消工具栏的透明状态
    self.tabBar.translucent = NO; //初始化三个子视图，放到tabbar中
    HeroViewController *heroVC=[[HeroViewController alloc]initWithType:HeroTypeAll];
    SearchViewController *searchVC=[SearchViewController new];
    BaiKeViewController *baikeVC=[BaiKeViewController new];
    UINavigationController *heroNavi=[[UINavigationController alloc] initWithRootViewController:heroVC];
    UINavigationController *searchNavi=[[UINavigationController alloc] initWithRootViewController:searchVC];
    UINavigationController *baikeNavi=[[UINavigationController alloc] initWithRootViewController:baikeVC];
    self.viewControllers=@[heroNavi,baikeNavi,searchNavi];
    heroVC.navigationController.tabBarItem.image = [UIImage imageNamed:@"find_chair"];
    searchVC.navigationController.tabBarItem.image = [UIImage imageNamed:@"icon_search_h"];
    baikeVC.navigationController.tabBarItem.image = [UIImage imageNamed:@"me_setting_college"];
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
