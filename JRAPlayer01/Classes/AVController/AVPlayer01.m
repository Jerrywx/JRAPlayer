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

@property (nonatomic, strong) JRPlayerLayer *la;
@property (nonatomic, strong) JRPlayerLayer	*playerLayer;
@property (nonatomic, strong) JRPlayerLayer	*playerLayer2;
@property (nonatomic, strong) JRPlayerLayer	*playerLayer3;
@property (nonatomic, strong) JRPlayerLayer	*playerLayer4;
@property (nonatomic, strong) JRPlayerLayer	*playerLayer5;
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
	
	self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
	self.scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width,
											  [UIScreen mainScreen].bounds.size.height * 5);
	[self.view addSubview:self.scrollView];
	
	CGFloat height		= [UIScreen mainScreen].bounds.size.width / 16.0 * 9;
//	1.
	JRPlayerLayer *la	= [[JRPlayerLayer alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, height)
														image:@"http://wimg.spriteapp.cn/x/750x400/picture/2016/0306/56dc0721b9301__93.jpg"
														asset:@"http://dvideo.spriteapp.cn/video/2016/0306/56dc0721b9301_wpd.mp4"];
	la.frame			= CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, height);
	[self.scrollView addSubview:la];
	self.la = la;
	
//	2.
	self.playerLayer	= [[JRPlayerLayer alloc] initWithFrame:CGRectMake(0, (height + 10), [UIScreen mainScreen].bounds.size.width, height)
													   image:@"http://dimg.spriteapp.cn/picture/2016/0308/56de8b3cb9254__48.jpg"
													   asset:@"http://dvideo.spriteapp.cn/video/2016/0308/56de8b3cb9254_wpd.mp4"];
	[self.scrollView addSubview:self.playerLayer];
	
//	3.
	self.playerLayer2	= [[JRPlayerLayer alloc] initWithFrame:CGRectMake(0, (height + 10) * 2, [UIScreen mainScreen].bounds.size.width, height)
													  image:@"http://wimg.spriteapp.cn/picture/2016/0307/56dce50231d01__61.jpg"
													  asset:@"http://dvideo.spriteapp.cn/video/2016/0307/56dce50231d01_wpc.mp4"];
	[self.scrollView addSubview:self.playerLayer2];
	
//	4.
	self.playerLayer3	= [[JRPlayerLayer alloc] initWithFrame:CGRectMake(0, (height + 10) * 3, [UIScreen mainScreen].bounds.size.width, height)
													   image:@"http://dimg.spriteapp.cn/picture/2016/0308/56de2e1b9a495__91.jpg"
													   asset:@"http://dvideo.spriteapp.cn/video/2016/0308/56de2e1b9a495_wpd.mp4"];
	[self.scrollView addSubview:self.playerLayer3];
	
//	5.
	self.playerLayer4	= [[JRPlayerLayer alloc] initWithFrame:CGRectMake(0, (height + 10) * 4, [UIScreen mainScreen].bounds.size.width, height)
													   image:@"http://wimg.spriteapp.cn/picture/2016/0307/56dd33950ca58__10.jpg"
													   asset:@"http://dvideo.spriteapp.cn/video/2016/0307/56dd33950ca58_wpc.mp4"];
	[self.scrollView addSubview:self.playerLayer4];
	
//	6.
	self.playerLayer4	= [[JRPlayerLayer alloc] initWithFrame:CGRectMake(0, (height + 10) * 5, [UIScreen mainScreen].bounds.size.width, height)
													   image:@"http://wimg.spriteapp.cn/picture/2016/0307/56dd6e4be1fa2_wpd.jpg"
													   asset:@"http://dvideo.spriteapp.cn/video/2016/0307/56dd6e4be1fa2_wpc.mp4"];
	[self.scrollView addSubview:self.playerLayer4];

//	6.
	JRPlayerLayer *playerLayer4	= [[JRPlayerLayer alloc] initWithFrame:CGRectMake(0, (height + 10) * 6, [UIScreen mainScreen].bounds.size.width, height)
													   image:@"http://wimg.spriteapp.cn/picture/2016/0307/56dd6e4be1fa2_wpd.jpg"
													   asset:@"http://dvideo.spriteapp.cn/video/2016/0307/56dd6e4be1fa2_wpc.mp4"];
	[self.scrollView addSubview:playerLayer4];
	
	//	6.
	JRPlayerLayer *playerLayer5	= [[JRPlayerLayer alloc] initWithFrame:CGRectMake(0, (height + 10) * 7, [UIScreen mainScreen].bounds.size.width, height)
																 image:@"http://wimg.spriteapp.cn/picture/2016/0307/56dd6e4be1fa2_wpd.jpg"
																 asset:@"http://dvideo.spriteapp.cn/video/2016/0307/56dd6e4be1fa2_wpc.mp4"];
	[self.scrollView addSubview:playerLayer5];
	
	//	6.
	JRPlayerLayer *playerLayer6	= [[JRPlayerLayer alloc] initWithFrame:CGRectMake(0, (height + 10) * 8, [UIScreen mainScreen].bounds.size.width, height)
																 image:@"http://wimg.spriteapp.cn/picture/2016/0307/56dd6e4be1fa2_wpd.jpg"
																 asset:@"http://dvideo.spriteapp.cn/video/2016/0307/56dd6e4be1fa2_wpc.mp4"];
	[self.scrollView addSubview:playerLayer6];
	
	//	6.
	JRPlayerLayer *playerLayer7	= [[JRPlayerLayer alloc] initWithFrame:CGRectMake(0, (height + 10) * 9, [UIScreen mainScreen].bounds.size.width, height)
																 image:@"http://wimg.spriteapp.cn/picture/2016/0307/56dd6e4be1fa2_wpd.jpg"
																 asset:@"http://dvideo.spriteapp.cn/video/2016/0307/56dd6e4be1fa2_wpc.mp4"];
	[self.scrollView addSubview:playerLayer7];
	
	//	6.
	JRPlayerLayer *playerLayer8	= [[JRPlayerLayer alloc] initWithFrame:CGRectMake(0, (height + 10) * 10, [UIScreen mainScreen].bounds.size.width, height)
																 image:@"http://wimg.spriteapp.cn/picture/2016/0307/56dd6e4be1fa2_wpd.jpg"
																 asset:@"http://dvideo.spriteapp.cn/video/2016/0307/56dd6e4be1fa2_wpc.mp4"];
	[self.scrollView addSubview:playerLayer8];
	
	//	6.
	JRPlayerLayer *playerLayer9	= [[JRPlayerLayer alloc] initWithFrame:CGRectMake(0, (height + 10) * 11, [UIScreen mainScreen].bounds.size.width, height)
																 image:@"http://wimg.spriteapp.cn/picture/2016/0307/56dd6e4be1fa2_wpd.jpg"
																 asset:@"http://dvideo.spriteapp.cn/video/2016/0307/56dd6e4be1fa2_wpc.mp4"];
	[self.scrollView addSubview:playerLayer9];
	
	//	6.
	JRPlayerLayer *playerLayer10 = [[JRPlayerLayer alloc] initWithFrame:CGRectMake(0, (height + 10) * 12, [UIScreen mainScreen].bounds.size.width, height)
																 image:@"http://wimg.spriteapp.cn/picture/2016/0307/56dd6e4be1fa2_wpd.jpg"
																 asset:@"http://dvideo.spriteapp.cn/video/2016/0307/56dd6e4be1fa2_wpc.mp4"];
	[self.scrollView addSubview:playerLayer10];

	//	6.
	JRPlayerLayer *playerLayer1 = [[JRPlayerLayer alloc] initWithFrame:CGRectMake(0, (height + 10) * 13, [UIScreen mainScreen].bounds.size.width, height)
																  image:@"http://wimg.spriteapp.cn/picture/2016/0307/56dd6e4be1fa2_wpd.jpg"
																  asset:@"http://dvideo.spriteapp.cn/video/2016/0307/56dd6e4be1fa2_wpc.mp4"];
	[self.scrollView addSubview:playerLayer1];
	
	//	6.
	JRPlayerLayer *playerLayer2 = [[JRPlayerLayer alloc] initWithFrame:CGRectMake(0, (height + 10) * 14, [UIScreen mainScreen].bounds.size.width, height)
																  image:@"http://wimg.spriteapp.cn/picture/2016/0307/56dd6e4be1fa2_wpd.jpg"
																  asset:@"http://dvideo.spriteapp.cn/video/2016/0307/56dd6e4be1fa2_wpc.mp4"];
	[self.scrollView addSubview:playerLayer2];
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
