//
//  DiscoverViewController.h
//  WeChatDemo
//
//  Created by 侯凌霄 on 2018/3/21.
//  Copyright © 2018 hou.ssdut. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CellIdentifier @"CellIdentifier"

@interface DiscoverViewController : UITableViewController

@property(strong, nonatomic) NSArray *arrayTitle;
@property(strong, nonatomic) NSArray *arrayImage;

@end
