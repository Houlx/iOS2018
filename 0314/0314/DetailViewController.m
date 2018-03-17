//
//  DetailViewController.m
//  0314
//
//  Created by 侯凌霄 on 2018/3/17.
//  Copyright © 2018年 hou.ssdut. All rights reserved.
//

#import "DetailViewController.h"
#import <WebKit/WebKit.h>


@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"CellIdentifier";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    NSInteger row = [indexPath row];
    NSDictionary *dict = self.listData[(NSUInteger) row];

    cell.textLabel.text = dict[@"name"];

    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;

    return cell;
}

@end
