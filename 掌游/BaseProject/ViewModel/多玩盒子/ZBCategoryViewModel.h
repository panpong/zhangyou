//
//  ZBCategoryViewModel.h
//  BaseProject
//
//  Created by 潘鹏 on 15/11/12.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"

@interface ZBCategoryViewModel : BaseViewModel
/** 行数 */
@property(nonatomic) NSInteger rowNumber;
/** 某行tag值 */
- (NSString *)tagForRow:(NSInteger)row;
/** 某行题目 */
- (NSString *)titleForRow:(NSInteger)row;
@end
