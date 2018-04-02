//
//  ViewController.h
//  ContactDemoCoreData
//
//  Created by 侯凌霄 on 2018/3/31.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CellIdentifier @"CellIdentifier"

@interface ViewController : UITableViewController {
    NSManagedObjectContext *context;
}

@property(strong, nonatomic) NSMutableArray *listName;

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *phone;
@property(strong, nonatomic) NSString *addr;

@end
