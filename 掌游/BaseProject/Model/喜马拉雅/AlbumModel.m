//
//  AlbumModel.m
//  BaseProject
//
//  Created by 潘鹏 on 15/11/2.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "AlbumModel.h"

@implementation AlbumModel

@end


@implementation AlbumAlbumModel

@end


@implementation AlbumTracksModel

+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [AlbumTracksListModel class]};
}

@end


@implementation AlbumTracksListModel

@end


