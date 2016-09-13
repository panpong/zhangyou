//
//  HeroVideoViewModel.h
//  BaseProject
//
//  Created by ios-42 on 15/11/18.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BaseViewModel.h"

@interface HeroVideoViewModel : BaseViewModel

- (id)initWithTag:(NSString *)tag;
@property (nonatomic,strong) NSString *tag;

@property (nonatomic) NSInteger rowNumber;
@property (nonatomic) NSInteger pageId;
/** 当前最大页数 */
@property(nonatomic) NSInteger maxPageId;
/** 是否有更多页面 */
@property(nonatomic, getter=isHasMore) BOOL hasMore;

- (NSString *)titleForRow:(NSInteger)row;
- (NSInteger)durationForRow:(NSInteger)row;
- (NSString *)uploadTimeForRow:(NSInteger)row;
- (NSString *)vidForRow:(NSInteger)row;
- (NSURL *)iconUrlRorRow:(NSInteger)row;
@end
