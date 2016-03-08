//
//  PlayViewCell.h
//  JRAVPlayer
//
//  Created by 王潇 on 16/3/8.
//  Copyright © 2016年 王潇. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SCREEN_W ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_H ([UIScreen mainScreen].bounds.size.height)
#define CELL_H (SCREEN_W / 16 * 9)

@interface PlayViewCell : UITableViewCell

@property (nonatomic, strong) NSString		*urlString;

@end
