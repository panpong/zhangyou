//
//  AllHeroModel.h
//  BaseProject
//  全部英雄
//  Created by 潘鹏 on 15/11/2.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BaseModel.h"

@class AllHeroAllModel;
@interface AllHeroModel : BaseModel

@property (nonatomic, strong) NSArray<AllHeroAllModel *> *all;

@end
@interface AllHeroAllModel : BaseModel

@property (nonatomic, copy) NSString *enName;

@property (nonatomic, copy) NSString *cnName;

@property (nonatomic, copy) NSString *rating;

@property (nonatomic, copy) NSString *location;

@property (nonatomic, copy) NSString *price;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *tags;

@end

