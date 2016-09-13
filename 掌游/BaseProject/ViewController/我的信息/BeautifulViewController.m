//
//  BeautifulViewController.m
//  BaseProject
//
//  Created by ios-42 on 15/11/21.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "BeautifulViewController.h"
#import "PSCollectionView.h"
#import "BeautifulViewModel.h"
#import "BeautDetailViewController.h"
@interface BeautifulViewController ()<UIScrollViewDelegate,PSCollectionViewDelegate,PSCollectionViewDataSource>
@property (nonatomic,strong) PSCollectionView *collectionView;
@property (nonatomic,strong) BeautifulViewModel *vm;

@end

@implementation BeautifulViewController

+(UINavigationController *)defaultNavi
{
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        BeautifulViewController *vc = [BeautifulViewController new];
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
        
        
    });
    return navi;
}
- (BeautifulViewModel *)vm{
    if (!_vm) {
        _vm = [BeautifulViewModel new];
    }
    return _vm;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"囧图";
    self.view.backgroundColor = [UIColor blackColor];
    [Factory addMenuItemToVC:self];
    self.collectionView = [[PSCollectionView alloc] initWithFrame:CGRectMake(0, 0, kWindowW, kWindowH)];
    self.collectionView.delegate = self;
    self.collectionView.collectionViewDelegate = self;
    self.collectionView.collectionViewDataSource = self;
    [self.view addSubview:self.collectionView];
    //设置竖向 两行
    self.collectionView.numColsPortrait = 2;
    //头部刷新
    self.collectionView.header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.vm refreshDataCompletionHandle:^(NSError *error) {
            [self.collectionView reloadData];
            if (error) {
                [self showErrorMsg:error.description];
            }
            [self.collectionView.header endRefreshing];
        }];
    }];
    [self.collectionView.header beginRefreshing];
    
    self.collectionView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.vm getMoreDataCompletionHandle:^(NSError *error) {
            [self.collectionView reloadData];
            if (error) {
                [self showErrorMsg:error.description];
            }
            [self.collectionView.footer endRefreshing];
        }];
    }];
}
- (NSInteger)numberOfRowsInCollectionView:(PSCollectionView *)collectionView{
    return self.vm.rowNumber;
}
- (CGFloat)collectionView:(PSCollectionView *)collectionView heightForRowAtIndex:(NSInteger)index{
    BeautifulDataModel *data = [self.vm.dataArr objectAtIndex:index];
    CGFloat width = data.coverWidth.floatValue;
    CGFloat height = data.coverHeight.floatValue;
    return (kWindowW/2 -12) *height/width;
}
- (PSCollectionViewCell *)collectionView:(PSCollectionView *)collectionView cellForRowAtIndex:(NSInteger)index{
    PSCollectionViewCell *cell = [collectionView dequeueReusableViewForClass:[PSCollectionViewCell class]];
    if (!cell) {
        cell = [[PSCollectionViewCell alloc] initWithFrame:CGRectZero];
        UIImageView *imageView=[UIImageView new];
        [cell addSubview:imageView];
        imageView.tag = 100;
    }
    UIImageView *iv = (UIImageView *)[cell viewWithTag:100];
    iv.frame = CGRectMake(0, 0, kWindowW/2 -12, [self collectionView:collectionView heightForRowAtIndex:index]);
    [iv setImageWithURL:[self.vm iconForRow:index]];
    return cell;
}

- (void)collectionView:(PSCollectionView *)collectionView didSelectCell:(PSCollectionViewCell *)cell atIndex:(NSInteger)index
{
    BeautDetailViewController *vc = [[BeautDetailViewController alloc]initWithAid:[self.vm albumForRow:index]];
    [self.navigationController pushViewController:vc animated:YES];
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
