//
//  HeroViewModel.m
//  BaseProject
//
//  Created by ios-42 on 15/11/18.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "HeroViewModel.h"
#import "AllHeroModel.h"
@implementation HeroViewModel

- (id)initWithHeroType:(HeroType)type
{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

- (NSInteger)rowNumber
{
    return self.dataArr.count;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getHeroWithType:_type completionHandle:^(AllHeroModel *model, NSError *error) {
        if (!error) {
            self.dataArr = [model.all copy];
        }
        completionHandle(error);
    }];
}

- (AllHeroAllModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}

- (NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
}
- (NSString *)cnNameForRow:(NSInteger)row
{
    return [self modelForRow:row].cnName;
}
- (NSURL *)iconUrlForRow:(NSInteger)row
{
    return [NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",[self modelForRow:row].enName]];
}

- (NSString *)locationForRow:(NSInteger)row
{
    return [self modelForRow:row].location;
}

- (NSString *)enNameForRow:(NSInteger)row
{
    return [self modelForRow:row].enName;
}
@end
