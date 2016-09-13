//
//  TuWanListViewController.h
//  BaseProject
//
//  Created by 潘鹏 on 15/11/6.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanListViewController : UITableViewController
/** 接收外部传参，决定当前控制器显示哪种类型的信息 */
@property(nonatomic,strong) NSNumber *infoType;
@end












