//
//  ChatsViewController.h
//  WeChatDemo
//
//  Created by 侯凌霄 on 2018/3/21.
//  Copyright © 2018 hou.ssdut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChatsViewController : UITableViewController

#define CellIdentifier @"CellIdentifier"

@property(nonatomic, strong) NSArray *listChats;

@end
