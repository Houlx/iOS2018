//
//  DetailViewController.h
//  ContactDemo
//
//  Created by 侯凌霄 on 2018/3/19.
//  Copyright © 2018 houlx.ssdut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UITableViewController

@property (nonatomic, strong)NSDictionary *contactData;
@property (nonatomic, strong)NSArray *data;
@property (nonatomic, strong)NSArray *keys;

@end
