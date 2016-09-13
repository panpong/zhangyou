//
//  HeroDetailModel.m
//  BaseProject
//
//  Created by 潘鹏 on 15/11/2.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "HeroDetailModel.h"

@implementation HeroDetailModel


+ (NSDictionary *)objectClassInArray{
    return @{@"like" : [HeroDetailLikeModel class], @"hate" : [HeroDetailHateModel class]};
}



@end

@implementation HeroDetailBraumModel

@end

@implementation HeroDetailLikeModel

@end


@implementation HeroDetailHateModel

@end


