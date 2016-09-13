//
//  BeautDetailViewController.m
//  BaseProject
//
//  Created by ios-42 on 15/11/21.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BeautDetailViewController.h"
#import "BeautDetailViewModel.h"
@interface BeautDetailViewController ()<MWPhotoBrowserDelegate>

@property (nonatomic,strong) BeautDetailViewModel *bdVM;
@end

@implementation BeautDetailViewController

- (BeautDetailViewModel *)bdVM {
    if(_bdVM == nil) {
        _bdVM = [[BeautDetailViewModel alloc] initWithAid:_aid];
    }
    return _bdVM;
}

- (id)initWithAid:(NSString *)aid
{
    if (self == [super init]) {
        _aid = aid;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Do any additional setup after loading the view.
    //非xib，storyboard。 默认背景色是透明
    self.view.backgroundColor = [UIColor whiteColor];
    [Factory addBackItemToVC:self];
    //请求时要有正在操作的提示
    [self showProgress];
    [self.bdVM getDataFromNetCompleteHandle:^(NSError *error) {
        [self hideProgress];
        //创建图片展示页面，Github排名最高的图片展示类控件
        MWPhotoBrowser *photoB = [[MWPhotoBrowser alloc] initWithDelegate:self];
        //图片展示页面不应该是当前页推出的，而应该是取代当前页面在导航控制器中的位置。
        NSMutableArray *naviVCs = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
        //删除掉最后一个控制器，即当前的白色控制器
        [naviVCs removeLastObject];
        //把图片控制器添加到最后
        [naviVCs addObject:photoB];
        //把新的控制器数组赋值给导航控制器
        self.navigationController.viewControllers = naviVCs;
    }];

}

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser{
    return self.bdVM.rowNumber;
}
- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index{
    MWPhoto *photo = [MWPhoto photoWithURL:[self.bdVM picURLForRow:index]];
    return photo;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
