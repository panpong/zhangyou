//
//  BeautifulModel.m
//  BaseProject
//
//  Created by ios-42 on 15/11/21.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BeautifulModel.h"

@implementation BeautifulModel
//特殊规定 data对应的值 由特殊类解析
+ (NSDictionary *)objectClassInArray{
    return @{@"data": [BeautifulDataModel class]};
}
@end

@implementation BeautifulDataModel
//通过字典返回 特殊的属性名
+ (NSDictionary *)replacedKeyFromPropertyName{
    return @{@"desc": @"description"};
}

@end
