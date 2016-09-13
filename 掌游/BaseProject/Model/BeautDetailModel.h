//
//  BeautDetailModel.h
//  BaseProject
//
//  Created by ios-42 on 15/11/21.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BaseModel.h"
//http://box.dwstatic.com/apiAlbum.php?action=d&albumId=119022&v=140&OSType=iOS9.1&versionName=2.4.0
@class BeautDetailPicturesModel;
@interface BeautDetailModel : BaseModel

@property (nonatomic, copy) NSString *picsum;

@property (nonatomic, copy) NSString *clicks;

@property (nonatomic, copy) NSString *updated;

@property (nonatomic, copy) NSString *commentCount;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<BeautDetailPicturesModel *> *pictures;

@property (nonatomic, copy) NSString *created;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, copy) NSString *galleryId;

@end
@interface BeautDetailPicturesModel : NSObject

@property (nonatomic, copy) NSString *fileHeight;

@property (nonatomic, copy) NSString *old;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *picId;

@property (nonatomic, copy) NSString *coverUrl;

@property (nonatomic, copy) NSString *picDesc;

@property (nonatomic, copy) NSString *fileUrl;

@property (nonatomic, copy) NSString *cai;

@property (nonatomic, copy) NSString *ding;

@property (nonatomic, copy) NSString *fileWidth;

@end

