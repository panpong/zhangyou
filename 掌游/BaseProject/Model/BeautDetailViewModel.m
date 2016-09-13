//
//  BeautDetailViewModel.m
//  BaseProject
//
//  Created by ios-42 on 15/11/21.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BeautDetailViewModel.h"

@implementation BeautDetailViewModel


- (id)initWithAid:(NSString *)aid
{
    if (self == [super init]) {
        _aid = aid;
        
    }
    return self;
}

- (NSInteger)rowNumber
{
    return self.picModel.pictures.count;
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle
{
    self.dataTask = [BeautifulNetwork getPicDetailWithId:_aid completionHandle:^(id model, NSError *error) {
        self.picModel = model;
        completionHandle(error);
    }];
}

- (NSURL *)picURLForRow:(NSInteger)row{
    BeautDetailPicturesModel *model = self.picModel.pictures[row];
    return [NSURL URLWithString:model.url];
}
@end
