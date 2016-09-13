//
//  BeautDetailModel.m
//  BaseProject
//
//  Created by ios-42 on 15/11/21.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BeautDetailModel.h"
//http://box.dwstatic.com/apiAlbum.php?action=d&albumId=119022&v=140&OSType=iOS9.1&versionName=2.4.0
@implementation BeautDetailModel


+ (NSDictionary *)objectClassInArray{
    return @{@"pictures" : [BeautDetailPicturesModel class]};
}
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"desc":@"description"};
}
@end
@implementation BeautDetailPicturesModel

@end


