//
//  SumAbilityDetailViewController.h
//  BaseProject
//
//  Created by 潘鹏 on 15/11/12.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SumAbilityModel.h"

@interface SumAbilityDetailViewController : UIViewController

- (id)initWithSumAbilityModel:(SumAbilityModel *)abilityModel;
@property(nonatomic,strong) SumAbilityModel *abilityModel;

@end
