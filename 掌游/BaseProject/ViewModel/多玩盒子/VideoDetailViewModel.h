//
//  VideoDetailViewModel.h
//  BaseProject
//
//  Created by ios-42 on 15/11/19.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BaseViewModel.h"
#import "DuoWanNetManager.h"
@interface VideoDetailViewModel : BaseViewModel

- (id)initWithVid:(NSString *)vid;
@property (nonatomic,strong) NSString *vid;

+ (void)getVideoWithVid:(NSString *)vid comletionHandle:(void(^)(id model,NSError *error))completionHandle;

@property (nonatomic,strong) VideoDetailResultItems1000TranscodeModel *obj;


@end
