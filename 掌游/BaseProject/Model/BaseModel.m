//
//  BaseModel.m
//  BaseProject
//
//  Created by 潘鹏 on 15/10/21.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

MJCodingImplementation

+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"typeName": @"typename", @"ID": @"id", @"desc": @"description"};
}
@end






