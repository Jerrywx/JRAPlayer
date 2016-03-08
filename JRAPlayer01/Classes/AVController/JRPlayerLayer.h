//
//  JRPlayerLayer.h
//  JRAVPlayer
//
//  Created by 王潇 on 16/3/8.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface JRPlayerLayer : UIView

@property (strong, nonatomic) AVPlayer			*player;
@property (strong, nonatomic) AVAsset			*asset;
@property (strong, nonatomic) AVPlayerItem		*playerItem;
@property (nonatomic, strong) NSString			*urlString;

- (instancetype)initWithFrame:(CGRect)frame
						image:(NSString *)imageUrl
						asset:(NSString *)assetUrl;

- (instancetype)initWithImage:(NSString *)imageUrl;

- (instancetype)initWithURL:(NSURL *)assetURL;

//- (instancetype)initWithFrame:(CGRect)frame asset:(NSURL *)assetURL;

- (void)prepareToPlay;

- (void)play;

- (void)pause;

@end
