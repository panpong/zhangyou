//
//  TuWanViewController.h
//  BaseProject
//
//  Created by 潘鹏 on 15/11/5.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WMPageController.h>

@interface TuWanViewController : WMPageController

//内容页的首页应该是单例的，每次进程都只初始化一次
+ (UINavigationController *)standardTuWanNavi;

@end











