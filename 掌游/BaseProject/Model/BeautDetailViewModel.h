//
//  BeautDetailViewModel.h
//  BaseProject
//
//  Created by ios-42 on 15/11/21.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BaseViewModel.h"
#import "BeautifulNetwork.h"
#import "BeautDetailModel.h"
@interface BeautDetailViewModel : BaseViewModel

/** 必须使用下方初始化方法 */
- (id)initWithAid:(NSString *)aid;
/** aid的赋值应该是非空,使用xcode7新加入的非空标识 */
@property(nonatomic,strong) NSString * aid;

@property(nonatomic) NSInteger rowNumber;
- (NSURL *)picURLForRow:(NSInteger)row;
@property(nonatomic,strong) BeautDetailModel *picModel;


@end
