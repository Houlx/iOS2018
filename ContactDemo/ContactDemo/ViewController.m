//
//  ViewController.m
//  ContactDemo
//
//  Created by 侯凌霄 on 2018/3/19.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"contacts" ofType:@"plist"];

    self.dictData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];

    NSArray *tempList = [self.dictData allKeys];
    self.listGroupName = [tempList sortedArrayUsingSelector:@selector(compare:)];

    self.title = @"联系人";

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellIdentifier"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *groupName = self.listGroupName[(NSUInteger) section];
    NSArray *listContacts = self.dictData[groupName];
    return [listContacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    NSUInteger section = (NSUInteger) [indexPath section];
    NSUInteger row = (NSUInteger) [indexPath row];
    NSString *groupName = self.listGroupName[section];
    NSArray *listContacts = self.dictData[groupName];   //字典数组
    NSDictionary *dict = listContacts[row];  //选中其中一个联系人（是一个字典）

    cell.textLabel.text = dict[@"name"];
    NSLog(@"tableView:cellForRowAtIndexPath");
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger section = (NSUInteger) [indexPath section];
    NSUInteger row = (NSUInteger) [indexPath row];

    DetailViewController *detailViewController = [[DetailViewController alloc] initWithStyle:UITableViewStylePlain];

    NSString *groupName = self.listGroupName[section];
    NSArray *listContacts = self.dictData[groupName];
    NSDictionary *dict = listContacts[row];



    detailViewController.contactData = dict;
    detailViewController.title = dict[@"name"];

    [self.navigationController pushViewController:detailViewController animated:TRUE];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    NSLog(@"numberOfSectionsInTableView");
    return [self.listGroupName count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *groupName = self.listGroupName[(NSUInteger) section];
//    NSLog(@"tableView:titleForHeaderInSection");
    return groupName;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *listTitles = [[NSMutableArray alloc] init];
    for (NSString *item in self.listGroupName) {
        NSString *title = [item substringToIndex:1];
        [listTitles addObject:title];
    }
//    NSLog(@"sectionIndexTitlesForTableView");
    return listTitles;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
