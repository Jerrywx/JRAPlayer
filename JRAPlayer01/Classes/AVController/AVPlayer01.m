//
//  AVPlayer01.m
//  JRAVPlayer
//
//  Created by 王潇 on 16/3/8.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "AVPlayer01.h"
#import "JRPlayerLayer.h"

@interface AVPlayer01 ()
@property (nonatomic, strong) NSURL			*localURL;
@property (nonatomic, strong) UIView		*playerView;
@property (nonatomic, strong) AVPlayerLayer	*playLayer;

@property (nonatomic, strong) JRPlayerLayer *la;
@property (nonatomic, strong) UIScrollView	*scrollView;
@property (nonatomic, assign) BOOL			isPlayed;
@end

@implementation AVPlayer01

- (void)viewDidLoad {
    [super viewDidLoad];
	[self setUpView];
}

- (void)setUpView {
	self.view.backgroundColor = [UIColor whiteColor];
	
	self.localURL	= [NSURL URLWithString:@"http://wvideo.spriteapp.cn/video/2016/0306/56dc32d2b3cb6_wpd.mp4"];
	self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
	self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,
											  [UIScreen mainScreen].bounds.size.height * 3);
	[self.view addSubview:self.scrollView];
	[self.scrollView.layer addSublayer:self.playLayer];
	
	CGFloat height		= [UIScreen mainScreen].bounds.size.width / 16.0 * 9;
//	
//	JRPlayerLayer *la	= [[JRPlayerLayer alloc] initWithURL:self.localURL];
	JRPlayerLayer *la	= [[JRPlayerLayer alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, height)
														image:@"http://wimg.spriteapp.cn/picture/2016/0308/56ddf56a53cd1_wpd.jpg"
														asset:nil];
	
	la.frame			= CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, height);
	[self.scrollView addSubview:la];
	self.la = la;
	
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
//	[self.la play];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[self.la pause];
}

@end
