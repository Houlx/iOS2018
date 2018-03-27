//
//  MeViewController.h
//  WeChatDemo
//
//  Created by 侯凌霄 on 2018/3/21.
//  Copyright © 2018 hou.ssdut. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CellIdentifier1 @"CellIdentifier1"
#define CellIdentifier2 @"CellIdentifier2"
#define CellIdentifier3 @"CellIdentifier3"

@interface MeViewController : UITableViewController

@property (strong, nonatomic)NSArray *items;
@property (strong, nonatomic)NSArray *images;
@end
