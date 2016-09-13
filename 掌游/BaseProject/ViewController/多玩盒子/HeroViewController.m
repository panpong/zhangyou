//
//  HeroViewController.m
//  BaseProject
//
//  Created by 潘鹏 on 15/11/11.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "HeroViewController.h"
#import "HeroVideoViewController.h"
@implementation HeroCell

- (TRImageView *)iconView {
    if(_iconView == nil) {
        _iconView = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.width.height.mas_equalTo(60);
        }];
    }
    return _iconView;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconView.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(self.iconView);
            make.right.mas_equalTo(0);
        }];
        _titleLb.font = [UIFont systemFontOfSize:16];
    }
    return _titleLb;
}

- (UILabel *)nameLb {
    if(_nameLb == nil) {
        _nameLb = [[UILabel alloc] init];
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconView.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo   (5);
            make.right.mas_equalTo(0);
        }];
        _nameLb.font = [UIFont systemFontOfSize:12];
        _nameLb.textColor = [UIColor lightGrayColor];
    }
    return _nameLb;
}

- (UILabel *)locationLb {
    if(_locationLb == nil) {
        _locationLb = [[UILabel alloc] init];
        [self.contentView addSubview:_locationLb];
        [_locationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconView.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(self.nameLb.mas_bottom).mas_equalTo(5);
            make.right.mas_equalTo(0);
        }];
        _locationLb.font = [UIFont systemFontOfSize:11];
        _locationLb.textColor = [UIColor midnightBlueColor];
    }
    return _locationLb;
}




@end

@interface HeroViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) HeroViewModel *heroVM;
@property (nonatomic,strong) UICollectionView *collectionView;
@end
@implementation HeroViewController

- (id)initWithType:(HeroType)type
{
    if (self = [super init]) {
        self.title = @"英雄";
        
        _type = type;
        [Factory addMenuItemToVC:self];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    [self.collectionView.header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.heroVM.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HeroCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconView.imageView setImageWithURL:[self.heroVM iconUrlForRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.nameLb.text = [self.heroVM cnNameForRow:indexPath.row];
    cell.titleLb.text = [self.heroVM titleForRow:indexPath.row];
    cell.locationLb.text = [self.heroVM locationForRow:indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    HeroVideoViewController *vc = [[HeroVideoViewController alloc]initWithTag:[self.heroVM enNameForRow:indexPath.row] cnName:[self.heroVM cnNameForRow:indexPath.row]];
    [self.navigationController pushViewController:vc animated:YES];
}



- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 5, 10, 5);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (kWindowW - 10 * 3)/2;
    CGFloat height = 70;
    return CGSizeMake(width, height);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (HeroViewModel *)heroVM {
	if(_heroVM == nil) {
        _heroVM = [[HeroViewModel alloc] initWithHeroType:_type];
	}
	return _heroVM;
}

- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
		_collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[UICollectionViewFlowLayout new]];
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.heroVM getDataFromNetCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else
                {
                    [_collectionView reloadData];
                }
                [_collectionView.header endRefreshing];
            }];
        }];
        [_collectionView registerClass:[HeroCell class] forCellWithReuseIdentifier:@"Cell"];
	}
	return _collectionView;
}

@end
