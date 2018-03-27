//
//  ContactsViewController.h
//  WeChatDemo
//
//  Created by 侯凌霄 on 2018/3/21.
//  Copyright © 2018 hou.ssdut. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CellIdentifier1 @"CellIdentifier1"
#define CellIdentifier2 @"CellIdentifier2"

@interface ContactsViewController : UITableViewController

@property (nonatomic, strong)NSDictionary *dictData;
@property (nonatomic, strong)NSArray *listGroupName;
@property (nonatomic, strong)NSArray *functions;
@property (nonatomic, strong)NSArray *funcIcons;
@end
