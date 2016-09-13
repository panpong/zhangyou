//
//  ZBItemViewController.h
//  BaseProject
//
//  Created by 潘鹏 on 15/11/12.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TRImageView.h"

@interface ZBItemViewController : UIViewController
- (id)initWithTag:(NSString *)tag name:(NSString *)name;
@property(nonatomic,strong) NSString *tag;
@end

@interface ZBItemCell : UICollectionViewCell
@property(nonatomic,strong) TRImageView *iconView;
@property(nonatomic,strong) UILabel *nameLb;
@end