//
//  BeautifulModel.h
//  BaseProject
//
//  Created by ios-42 on 15/11/21.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BaseModel.h"

@interface BeautifulModel : BaseModel

@property(nonatomic,strong) NSArray *data;
@property(nonatomic,strong) NSNumber *pageNum;
@property(nonatomic,strong) NSNumber *totalPage;
@property(nonatomic,strong) NSNumber *pageSize;
@property(nonatomic,strong) NSNumber *totalRecord;

@end
@interface BeautifulDataModel : BaseModel

@property(nonatomic,strong) NSString *clicks;
@property(nonatomic,strong) NSString *commentCount;
@property(nonatomic,strong) NSString *coverHeight;
@property(nonatomic,strong) NSString *coverUrl;
@property(nonatomic,strong) NSString *coverWidth;
@property(nonatomic,strong) NSString *created;
@property(nonatomic,strong) NSString *desc;
@property(nonatomic,strong) NSString *destUrl;
@property(nonatomic,strong) NSString *galleryId;
@property(nonatomic,strong) NSString *modify_time;
@property(nonatomic,strong) NSString *picsum;
@property(nonatomic,strong) NSString *title;
@property(nonatomic,strong) NSString *updated;

@end