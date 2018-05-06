//
//  ContactListViewController.h
//  AddrBook
//
//  Created by 侯凌霄 on 2018/5/4.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BmobSDK/BmobUser.h>
#import <BmobSDK/BmobQuery.h>
#import <BmobSDK/BmobObject.h>
#import "Contact.h"
#import "DetailTableViewController.h"

@interface ContactListViewController : UITableViewController

@property(nonatomic, strong) NSMutableArray *listContact;

@end
