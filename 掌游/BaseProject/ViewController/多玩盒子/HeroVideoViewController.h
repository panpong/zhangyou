//
//  HeroVideoViewController.h
//  BaseProject
//
//  Created by ios-42 on 15/11/18.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"
@interface HeroVideoViewController : UIViewController

- (id)initWithTag:(NSString *)tag cnName:(NSString *)cnName;
@property (nonatomic,strong) NSString *tag;
@property (nonatomic,strong) NSString *cnName;
@end
@interface HeroVideoCell : UITableViewCell

@property (nonatomic,strong) TRImageView *iconView;
@property (nonatomic,strong) UILabel *titleLb;
@property (nonatomic,strong) UILabel *durationLb;
@property (nonatomic,strong) UILabel *uploadLb;



@end