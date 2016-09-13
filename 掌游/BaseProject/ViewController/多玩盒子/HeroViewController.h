//
//  HeroViewController.h
//  BaseProject
//
//  Created by 潘鹏 on 15/11/11.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
#import "HeroViewModel.h"
@interface HeroViewController : UIViewController
- (id)initWithType:(HeroType)type;
@property (nonatomic) HeroType type;

@end
@interface HeroCell : UICollectionViewCell

@property (nonatomic,strong) TRImageView *iconView;
@property (nonatomic,strong) UILabel *titleLb;
@property (nonatomic,strong) UILabel *nameLb;
@property (nonatomic,strong) UILabel *locationLb;



@end