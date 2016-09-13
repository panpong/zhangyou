//
//  HeroVideoViewModel.m
//  BaseProject
//
//  Created by ios-42 on 15/11/18.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "HeroVideoViewModel.h"
#import "DuoWanNetManager.h"

@implementation HeroVideoViewModel

- (id)initWithTag:(NSString *)tag
{
    if (self = [super init]) {
        _tag = tag;
       
    }
    return self;
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _pageId = 1;
    [self getDataFromNetCompleteHandle:completionHandle];
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [DuoWanNetManager getHeroVideosWithPage:_pageId tag:_tag completionHandle:^(NSArray *arr, NSError *error) {
        if (!error) {
            if (_pageId == 1) {
                [self.dataArr removeAllObjects];
            }
            [self.dataArr addObjectsFromArray:arr];
            HeroVideoModel *model = arr.lastObject;
            _maxPageId = model.totalPage;
        }
        completionHandle(error);
        
    }];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    if (self.isHasMore) {
        _pageId += 1;
        [self getDataFromNetCompleteHandle:completionHandle];
    }else
    {
        NSError *err = [NSError errorWithDomain:@"" code:999 userInfo:@{NSLocalizedDescriptionKey:@"没有更多数据了"}];
        completionHandle(err);
    }

}
- (NSInteger)rowNumber
{
    return self.dataArr.count;
}

- (HeroVideoModel *)modelForRow:(NSInteger)row
{
    return self.dataArr[row];
}

- (NSString *)titleForRow:(NSInteger)row
{
    return [self modelForRow:row].title;
}
- (NSInteger)durationForRow:(NSInteger)row
{
    return [self modelForRow:row].videoLength;
}
- (NSString *)uploadTimeForRow:(NSInteger)row
{
    return [self modelForRow:row].uploadTime;
}
- (NSString *)vidForRow:(NSInteger)row
{
    return [self modelForRow:row].vid;
}
- (NSURL *)iconUrlRorRow:(NSInteger)row
{
    return [NSURL URLWithString:[self modelForRow:row].coverUrl];
}
- (BOOL)isHasMore{
    return _maxPageId > _pageId;
}

@end

