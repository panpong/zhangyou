//
//  TuWanVideoModel.m
//  BaseProject
//
//  Created by 潘鹏 on 15/11/8.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "TuWanVideoModel.h"

@implementation TuWanVideoModel


+ (NSDictionary *)objectClassInArray{
    return @{@"content" : [TuWanVideoContentModel class], @"relevant" : [TuWanVideoRelevantModel class]};
}
@end
@implementation TuWanVideoContentModel

@end


@implementation TuWanVideoRelevantModel

@end


