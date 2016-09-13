//
//  ZBItemViewModel.h
//  BaseProject
//
//  Created by 潘鹏 on 15/11/12.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"

@interface ZBItemViewModel : BaseViewModel
- (id)initWithTag:(NSString *)tag;
@property(nonatomic,strong) NSString *tag;


@property(nonatomic) NSInteger rowNumber;

- (NSString *)itemNameForRow:(NSInteger)row;
- (NSURL *)iconURLForRow:(NSInteger)row;
- (NSInteger)itemIdForRow:(NSInteger)row;

@end
