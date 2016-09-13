//
//  FreeHeroModel.m
//  BaseProject
//
//  Created by 潘鹏 on 15/11/2.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "FreeHeroModel.h"

@implementation FreeHeroModel


+ (NSDictionary *)objectClassInArray{
    return @{@"free" : [FreeHeroFreeModel class]};
}
@end
@implementation FreeHeroFreeModel

@end


