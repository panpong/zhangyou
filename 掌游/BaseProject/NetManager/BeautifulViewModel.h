//
//  BeautifulViewModel.h
//  BaseProject
//
//  Created by ios-42 on 15/11/21.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BaseViewModel.h"
#import "BeautifulNetwork.h"
@interface BeautifulViewModel : BaseViewModel

@property(nonatomic) NSInteger rowNumber;

- (NSURL *)iconForRow:(NSInteger)row;

- (NSString *)albumForRow:(NSInteger)row;

@property(nonatomic) NSInteger page;
@end
