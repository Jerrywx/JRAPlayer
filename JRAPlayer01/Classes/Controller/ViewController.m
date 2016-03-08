//
//  ViewController.m
//  JRAVPlayer
//
//  Created by 王潇 on 16/3/8.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "ViewController.h"
#import "AVPlayer01.h"
#import "PlayViewCell.h"

#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)
#define CELL_H (SCREEN_W / 16 * 9 + 10)

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView	*tableView;
@property (nonatomic, strong) NSArray		*urlArray;
@property (nonatomic, strong) NSMutableArray	*cellArray;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	self.cellArray = [NSMutableArray array];
	
	for (NSString *url in self.urlArray) {
		PlayViewCell *cell = [[PlayViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
		cell.urlString = url;
		[self.cellArray addObject:cell];
	}
	
	[self setUpView];
}

#pragma mark - 
- (void)setUpView {
	self.view.backgroundColor = [UIColor whiteColor];
	
	self.tableView = ({
		UITableView *tableView	= [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
		tableView.delegate		= self;
		tableView.dataSource	= self;
		tableView;
	});
	[self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.urlArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
	}
//	cell.urlString = self.urlArray[indexPath.row];
	cell.textLabel.text = @"TEXT-CELL";
	return cell;
	
//	if (self.cellArray.count <= indexPath.row) {
//		return nil;
//	}
//	PlayViewCell *cell = self.cellArray[indexPath.row];
//	return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	AVPlayer01 *play01 = [[AVPlayer01 alloc] init];
	[self.navigationController pushViewController:play01 animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 44;
//	return CELL_H;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
	return 0.1;
}

- (NSArray *)urlArray {
	if (_urlArray) {
		return _urlArray;
	}
	
	_urlArray = @[@"http://wvideo.spriteapp.cn/video/2016/0308/56ddf56a53cd1_wpd.mp4",
				  @"http://wvideo.spriteapp.cn/video/2016/0306/56dc10ce82345_wpd.mp4",
				  @"http://wvideo.spriteapp.cn/video/2016/0306/56dbde702bfe0_wpd.mp4",
				  @"http://wvideo.spriteapp.cn/video/2016/0307/56dd4bd4b98b7_wpc.mp4",
				  @"http://wvideo.spriteapp.cn/video/2016/0308/56de220dde23c_wpd.mp4",
				  @"http://wvideo.spriteapp.cn/video/2016/0307/56dd37393a142_wpd.mp4",
				  @"http://wvideo.spriteapp.cn/video/2016/0306/56dc32d2b3cb6_wpd.mp4",
				  @"http://wvideo.spriteapp.cn/video/2016/0306/56dbcf405d103_wpd.mp4",
				  @"http://wvideo.spriteapp.cn/video/2016/0305/56da79a6644ef_wpd.mp4",
				  @"http://wvideo.spriteapp.cn/video/2016/0307/56dd3388019d3_wpd.mp4",
				  @"http://wvideo.spriteapp.cn/video/2016/0305/56dadde456dfe_wpd.mp4"];
	
	return _urlArray;
}

@end
