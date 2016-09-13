//
//  VideoDetailViewModel.m
//  BaseProject
//
//  Created by ios-42 on 15/11/19.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "VideoDetailViewModel.h"

@implementation VideoDetailViewModel

- (id)initWithVid:(NSString *)vid
{
    if (self = [super init]) {
        _vid = vid;
    }
    return self;
}

+ (void)getVideoWithVid:(NSString *)vid comletionHandle:(void (^)(id, NSError *))completionHandle
{
    [DuoWanNetManager getheroVideoDetailWithVid:vid completionHandle:^(VideoDetailModel *model, NSError *error) {
        completionHandle(model,error);
    }];
}

@end
