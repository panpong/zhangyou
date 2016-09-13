//
//  VideoDetailModel.h
//  BaseProject
//
//  Created by ios-42 on 15/11/19.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BaseModel.h"

@class VideoDetailResultModel,VideoDetailResultItemsModel,VideoDetailResultItems350Model,VideoDetailResultItems350TranscodeModel,VideoDetailResultItems1000Model,VideoDetailResultItems1000TranscodeModel,VideoDetailResultItems1300Model,VideoDetailResultItems1300TranscodeModel;
@interface VideoDetailModel : BaseModel

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) VideoDetailResultModel *result;

@property (nonatomic, assign) NSInteger code;

@end
@interface VideoDetailResultModel : NSObject

@property (nonatomic, strong) VideoDetailResultItemsModel *items;

@property (nonatomic, copy) NSString *cover;

@end

@interface VideoDetailResultItemsModel : NSObject

@property (nonatomic, strong) VideoDetailResultItems350Model *m350;

@property (nonatomic, strong) VideoDetailResultItems1000Model *m1000;

@property (nonatomic, strong) VideoDetailResultItems1300Model *m1300;

@end

@interface VideoDetailResultItems350Model : NSObject

@property (nonatomic, strong) VideoDetailResultItems350TranscodeModel *transcode;

@property (nonatomic, copy) NSString *video_name;

@property (nonatomic, copy) NSString *transcode_id;

@property (nonatomic, copy) NSString *vid;

@property (nonatomic, copy) NSString *definition;

@end

@interface VideoDetailResultItems350TranscodeModel : NSObject

@property (nonatomic, copy) NSString *height;

@property (nonatomic, strong) NSArray<NSString *> *urls;

@property (nonatomic, copy) NSString *width;

@property (nonatomic, copy) NSString *transcode_id;

@property (nonatomic, copy) NSString *size;

@property (nonatomic, copy) NSString *video_name;

@property (nonatomic, copy) NSString *duration;

@property (nonatomic, copy) NSString *path;

@end

@interface VideoDetailResultItems1000Model : NSObject

@property (nonatomic, strong) VideoDetailResultItems1000TranscodeModel *transcode;

@property (nonatomic, copy) NSString *video_name;

@property (nonatomic, copy) NSString *transcode_id;

@property (nonatomic, copy) NSString *vid;

@property (nonatomic, copy) NSString *definition;

@end

@interface VideoDetailResultItems1000TranscodeModel : NSObject

@property (nonatomic, copy) NSString *height;

@property (nonatomic, strong) NSArray<NSString *> *urls;

@property (nonatomic, copy) NSString *width;

@property (nonatomic, copy) NSString *transcode_id;

@property (nonatomic, copy) NSString *size;

@property (nonatomic, copy) NSString *video_name;

@property (nonatomic, copy) NSString *duration;

@property (nonatomic, copy) NSString *path;

@end

@interface VideoDetailResultItems1300Model : NSObject

@property (nonatomic, strong) VideoDetailResultItems1300TranscodeModel *transcode;

@property (nonatomic, copy) NSString *video_name;

@property (nonatomic, copy) NSString *transcode_id;

@property (nonatomic, copy) NSString *vid;

@property (nonatomic, copy) NSString *definition;

@end

@interface VideoDetailResultItems1300TranscodeModel : NSObject

@property (nonatomic, copy) NSString *height;

@property (nonatomic, strong) NSArray<NSString *> *urls;

@property (nonatomic, copy) NSString *width;

@property (nonatomic, copy) NSString *transcode_id;

@property (nonatomic, copy) NSString *size;

@property (nonatomic, copy) NSString *video_name;

@property (nonatomic, copy) NSString *duration;

@property (nonatomic, copy) NSString *path;

@end

