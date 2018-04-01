//
//  DetailViewController.h
//  ContactDemoCoreData
//
//  Created by 侯凌霄 on 2018/4/1.
//  Copyright © 2018 houlx.ssdut. All rights reserved.
//

#import <UIKit/UIKit.h>

#define CellIdentifier @"CellIdentifier"


@interface DetailViewController : UITableViewController

@property(nonatomic, weak) NSString *name;
@property(nonatomic, strong) NSArray *contactDetail;

@end
