//
//  JRPlayerLayer.m
//  JRAVPlayer
//
//  Created by 王潇 on 16/3/8.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "JRPlayerLayer.h"

#define STATUS_KEYPATH @"status"
static const NSString *PlayerItemStatusContext;

@interface JRPlayerLayer ()
@property (nonatomic, strong) UIButton					*playControl;		// 播放控制按钮
@property (nonatomic, strong) UIActivityIndicatorView	*activity;			// 菊花

@property (nonatomic, strong) UIButton					*appearBtn;			// 开始播放按钮
@property (nonatomic, strong) CALayer					*imageLayer;		//
@end

@implementation JRPlayerLayer

- (instancetype)initWithFrame:(CGRect)frame
						image:(NSString *)imageUrl
						asset:(NSString *)assetUrl {

	if (self = [super init]) {
		self.frame = frame;
		_asset = [AVAsset assetWithURL:[NSURL URLWithString:assetUrl]];
		[self setImage:imageUrl];
	}
	return self;
}

- (void)setImage:(NSString *)imageUrl {
	
	// 1. Image
	self.imageLayer = [CALayer layer];
	NSData *data	= [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
	UIImage *image	= [UIImage imageWithData:data];
	self.imageLayer.contents = (__bridge id _Nullable)([image CGImage]);
	[self.layer addSublayer:self.imageLayer];
	
	// 2. playBtn
	self.appearBtn	= [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
	[self.appearBtn setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
	[self addSubview:self.appearBtn];
	[self.appearBtn addTarget:self action:@selector(prepareToPlay) forControlEvents:UIControlEventTouchUpInside];
}

//- (instancetype)initWithImage:(NSString *)imageUrl;

- (id)initWithURL:(NSURL *)assetURL {
	
	if (self = [super init]) {
		_asset = [AVAsset assetWithURL:assetURL];
//		[self prepareToPlay];
		[self setView];
	}
	return self;
}

- (void)setUrlString:(NSString *)urlString {
	_urlString = urlString;
	_asset = [AVAsset assetWithURL:[NSURL URLWithString:urlString]];
//	[self prepareToPlay];
//	[self appear];
//	[self setView];
}

- (void)appear {
	
	self.appearBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
	[self.appearBtn setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
	[self addSubview:self.appearBtn];
	[self.appearBtn addTarget:self action:@selector(prepareToPlay) forControlEvents:UIControlEventTouchUpInside];
	
	NSLog(@"===f: %@", NSStringFromCGRect(self.imageLayer.bounds));
}

- (void)prepareToPlay {
	
	// 1. 获取属性
	NSArray *keys = @[
					  @"tracks",
					  @"duration",
					  @"commonMetadata",
					  @"availableMediaCharacteristicsWithMediaSelectionOptions",
					  @"presentationSize"
					  ];

	// 2. 创建 AVPlayerItem
	self.playerItem = [AVPlayerItem playerItemWithAsset:self.asset          // 2
						   automaticallyLoadedAssetKeys:keys];
	
	// 3. 监控播放状态
	[self.playerItem addObserver:self                                       // 3
					  forKeyPath:STATUS_KEYPATH
						 options:0
						 context:&PlayerItemStatusContext];

	// 4. 创建播放对象
	self.player		= [AVPlayer playerWithPlayerItem:self.playerItem];      // 4
	
	// 5. 添加到 View
	[(AVPlayerLayer *) [self layer] setPlayer:self.player];
	
	if (self.appearBtn) {
		[self.appearBtn removeFromSuperview];
	}
	
	[self play];
	[self setView];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
					  ofObject:(id)object
						change:(NSDictionary *)change
					   context:(void *)context {
	
	NSLog(@"================== %@", change);
	[self updateControlView];
}

- (void)setView {
	
	// 1. 播放控制
	self.playControl = [UIButton buttonWithType:UIButtonTypeContactAdd];
	self.playControl = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 60)];
	[self.playControl setImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
	[self.playControl setImage:[UIImage imageNamed:@"pause"] forState:UIControlStateHighlighted];
	[self addSubview:self.playControl];
	[self.playControl addTarget:self action:@selector(playCont) forControlEvents:UIControlEventTouchUpInside];
	
	// 2. 菊花
	self.activity = [[UIActivityIndicatorView alloc] init];
	[self addSubview:self.activity];
	
	//
	[self updateControlView];
}

- (void)updateControlView {

	self.activity.hidden = YES;
	self.playControl.hidden = YES;
	if (self.player.status != 1) {
		self.activity.hidden = NO;
		[self.activity startAnimating];
	} else if (self.player.status == 1) {
		
		if (self.appearBtn) {
			[self.appearBtn removeFromSuperview];
		}
		
		if (self.player.rate == 0) {
			self.playControl.hidden = NO;
		} else {
			self.playControl.hidden = YES;
		}
	}
}

- (void)layoutSubviews {
	[super layoutSubviews];
	self.playControl.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
	self.activity.center	= CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
	self.appearBtn.center	= CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
	self.imageLayer.frame = self.bounds;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	[self playCont];
}

#pragma mark - THTransportDelegate Methods
- (void)playCont {

	if (self.player.rate == 0.0) {
		[self.player setRate:1.0];
	} else if (self.player.rate == 1.0) {
		[self.player setRate:0.0];
	}
	[self updateControlView];
}

// 播放
- (void)play {
	[self.player play];
	[self updateControlView];
}

- (void)pause {
	[self.player pause];
	[self updateControlView];
}

- (void)dealloc {
	[self.playerItem removeObserver:self forKeyPath:STATUS_KEYPATH];
}

+ (Class)layerClass {                                                       // 2
	return [AVPlayerLayer class];
}

@end
