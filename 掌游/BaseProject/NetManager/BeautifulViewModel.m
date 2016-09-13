//
//  BeautifulViewModel.m
//  BaseProject
//
//  Created by ios-42 on 15/11/21.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BeautifulViewModel.h"

@implementation BeautifulViewModel

- (NSInteger)rowNumber{
    return self.dataArr.count;
}
- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle
{
    _page = 1;
    [self getDataCompleteHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle
{
    _page += 1;
    [self getDataCompleteHandle:completionHandle];
}
- (void)getDataCompleteHandle:(void (^)(NSError *))complete{
    [BeautifulNetwork getBeautifulWomanForPage:_page completionHandle:^(BeautifulModel *model, NSError *error) {
        if (_page == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data];
        complete(error);
    }];
}
- (NSURL *)iconForRow:(NSInteger)row{
   BeautifulDataModel *data = self.dataArr[row];
    return [NSURL URLWithString:data.coverUrl];
}

- (NSString *)albumForRow:(NSInteger)row
{
    BeautifulDataModel *data = self.dataArr[row];
    return data.galleryId;

}

@end
