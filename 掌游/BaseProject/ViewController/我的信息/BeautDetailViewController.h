//
//  BeautDetailViewController.h
//  BaseProject
//
//  Created by ios-42 on 15/11/21.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BeautDetailViewController : UIViewController

{
@private //私有
    NSString *private1;
@protected  //保护--默认是保护
    NSString *protected1;
@public     //共有
    NSString *public1;
}
/** 此界面内容要根据aid来决定，所以aid是必须的 */
- (id _Nonnull)initWithAid:(NSString * _Nonnull )aid;
@property(nonatomic,strong) NSString * _Nonnull aid;

@end
