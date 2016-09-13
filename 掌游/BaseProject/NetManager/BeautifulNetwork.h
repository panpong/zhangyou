//
//  BeautifulNetwork.h
//  BaseProject
//
//  Created by ios-42 on 15/11/21.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BaseNetManager.h"
#import "BeautifulModel.h"
@interface BeautifulNetwork : BaseNetManager

+ (id)getBeautifulWomanForPage:(NSInteger)page completionHandle:(void(^)(BeautifulModel *model, NSError *error))complete;

+ (id)getPicDetailWithId:(NSString *)aid kCompletionHandle;
@end
