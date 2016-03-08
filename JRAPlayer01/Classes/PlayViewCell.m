//
//  PlayViewCell.m
//  JRAVPlayer
//
//  Created by 王潇 on 16/3/8.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import "PlayViewCell.h"
#import "JRPlayerLayer.h"


@interface PlayViewCell ()
@property (nonatomic, strong) JRPlayerLayer		*playerView;
@end

@implementation PlayViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	
	if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
		CGRect frame = CGRectMake(0, 5, SCREEN_W, CELL_H);
		self.playerView = [[JRPlayerLayer alloc] initWithFrame:frame];
		self.playerView.backgroundColor = [UIColor blackColor];
		[self.contentView addSubview:self.playerView];
	}
	return self;
}

- (void)setUrlString:(NSString *)urlString {
	_urlString = urlString;
	self.playerView.urlString = urlString;
}

@end
