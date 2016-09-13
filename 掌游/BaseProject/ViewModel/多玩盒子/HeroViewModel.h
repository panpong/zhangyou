//
//  HeroViewModel.h
//  BaseProject
//
//  Created by ios-42 on 15/11/18.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface HeroViewModel : BaseViewModel

-(id)initWithHeroType:(HeroType)type;
@property (nonatomic) HeroType type;

@property (nonatomic)NSInteger rowNumber;

- (NSString *)cnNameForRow:(NSInteger)row;
- (NSURL *)iconUrlForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)locationForRow:(NSInteger)row;
- (NSString *)enNameForRow:(NSInteger)row;
@end
