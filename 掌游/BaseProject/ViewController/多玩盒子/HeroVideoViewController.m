//
//  HeroVideoViewController.m
//  BaseProject
//
//  Created by ios-42 on 15/11/18.
//  Copyright © 2015年 xingchen. All rights reserved.
//

#import "HeroVideoViewController.h"
#import "HeroVideoViewModel.h"
#import "VideoDetailViewModel.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@implementation HeroVideoCell

- (TRImageView *)iconView {
    if(_iconView == nil) {
        _iconView = [[TRImageView alloc] init];
        [self.contentView addSubview:_iconView];
        [_iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(92, 70));
            make.centerY.mas_equalTo(0);
        }];
    }
    return _iconView;
}

- (UILabel *)titleLb {
    if(_titleLb == nil) {
        _titleLb = [[UILabel alloc] init];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconView.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(_iconView.mas_topMargin).mas_equalTo(3);
        }];
        _titleLb.numberOfLines = 0;
    }
    return _titleLb;
}

- (UILabel *)durationLb {
    if(_durationLb == nil) {
        _durationLb = [[UILabel alloc] init];
        [self.contentView addSubview:_durationLb];
        [_durationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_iconView.mas_right).mas_equalTo(8);
            make.bottomMargin.mas_equalTo(_iconView.mas_bottom).mas_equalTo(-5);
            make.width.mas_equalTo(70);
        }];
        _durationLb.font = [UIFont systemFontOfSize:12];
        _durationLb.textColor = [UIColor lightGrayColor];
    }
    return _durationLb;
}

- (UILabel *)uploadLb {
    if(_uploadLb == nil) {
        _uploadLb = [[UILabel alloc] init];
         UIImageView *imageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sound_play"]];
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.bottomMargin.mas_equalTo(_iconView.mas_bottomMargin).mas_equalTo(0);
             make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        [self.contentView addSubview:_uploadLb];
        [_uploadLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(imageView.mas_left).mas_equalTo(-8);
            make.bottomMargin.mas_equalTo(_durationLb);
            make.width.mas_equalTo(50);
        }];
        _uploadLb.font = [UIFont systemFontOfSize:12];
        _uploadLb.textColor = [UIColor lightGrayColor];
        
    }
    return _uploadLb;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //分割线距离左侧空间
        self.separatorInset=UIEdgeInsetsMake(0, 20, 0, 0);
    }
    return self;
}

@end

@interface HeroVideoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) HeroVideoViewModel *heroVideoVM;
@property (nonatomic,strong) VideoDetailViewModel *vdVM;

@end

@implementation HeroVideoViewController

- (id)initWithTag:(NSString *)tag cnName:(NSString *)cnName
{
    if (self = [super init]) {
        _tag = tag;
        _cnName = cnName;
        self.title = [NSString stringWithFormat:@"%@视频",cnName];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView.header beginRefreshing];
    [Factory addBackItemToVC:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.heroVideoVM.rowNumber;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HeroVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconView.imageView setImageWithURL:[self.heroVideoVM iconUrlRorRow:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    cell.titleLb.text = [self.heroVideoVM titleForRow:indexPath.row];
    NSInteger time = [self.heroVideoVM durationForRow:indexPath.row];
    cell.durationLb.text = [NSString stringWithFormat:@"%02ld:%02ld:%02ld",time/3600,time%3600/60,time%60];
    NSRange r = NSMakeRange(5, 5);
    NSString *str = [self.heroVideoVM uploadTimeForRow:indexPath.row];
    cell.uploadLb.text = [str substringWithRange:r];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    AVPlayerViewController *vc = [AVPlayerViewController new];
    [VideoDetailViewModel getVideoWithVid:[self.heroVideoVM vidForRow:indexPath.row] comletionHandle:^(VideoDetailModel *model, NSError *error) {
        VideoDetailResultItems1000TranscodeModel *obj = model.result.items.m1000.transcode;
        NSString *url = obj.urls.firstObject;
        vc.player = [AVPlayer playerWithURL:[NSURL URLWithString:url]];
    }];
    [self presentViewController:vc animated:YES completion:nil];
    [vc.player play];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UITableView *)tableView {
	if(_tableView == nil) {
		_tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[HeroVideoCell class] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self.heroVideoVM refreshDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else
                {
                    [_tableView reloadData];
                    [_tableView.footer resetNoMoreData];
                }
                [_tableView.header endRefreshing];
            }];
            
        }];
        _tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self.heroVideoVM getMoreDataCompletionHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                    [_tableView.footer endRefreshing];
                }else
                {
                    [_tableView reloadData];
                    if (self.heroVideoVM.isHasMore) {
                        [_tableView.footer endRefreshing];
                    }else{
                        [_tableView.footer endRefreshingWithNoMoreData];
                    }
                }
            }];
        }];
	}
	return _tableView;
}



- (HeroVideoViewModel *)heroVideoVM {
	if(_heroVideoVM == nil) {
		_heroVideoVM = [[HeroVideoViewModel alloc] initWithTag:_tag];
	}
	return _heroVideoVM;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}

- (VideoDetailViewModel *)vdVM {
	if(_vdVM == nil) {
		_vdVM = [VideoDetailViewModel new];
	}
	return _vdVM;
}

@end
