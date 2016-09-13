//
//  BeautifulNetwork.m
//  BaseProject
//
//  Created by ios-42 on 15/11/21.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BeautifulNetwork.h"
#import "BeautDetailModel.h"
@implementation BeautifulNetwork

+ (id)getBeautifulWomanForPage:(NSInteger)page completionHandle:(void(^)( BeautifulModel *model, NSError *error))complete{
    NSString *path=@"http://box.dwstatic.com/apiAlbum.php";
    NSDictionary *params=@{@"action":@"l", @"albumsTag":@"jiongTu", @"p":@(page), @"v":@"77", @"OSType":@"iOS8.2", @"versionName":@"2.1.7"};
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        complete([BeautifulModel objectWithKeyValues:responseObj],error);
    }];
}

+ (id)getPicDetailWithId:(NSString *)aid completionHandle:(void (^)(id, NSError *))completionHandle
{
    NSString *path = @"http://box.dwstatic.com/apiAlbum.php?action=d&albumId=119022&v=140&OSType=iOS9.1&versionName=2.4.0";
    NSDictionary *params = @{@"action":@"d",@"albumId":aid,@"v":@"140",@"OSType":@"iOS9.1",@"versionName":@"2.4.0"};
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([BeautDetailModel objectWithKeyValues:responseObj],error);
    }];
}


@end
