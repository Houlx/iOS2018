//
//  ViewController.m
//  0314
//
//  Created by 侯凌霄 on 2018/3/14.
//  Copyright © 2018 hou.ssdut. All rights reserved.
//

#import "ViewController.h"
#import "ContactsViewController.h"
#import "DetailViewController.h"

#define CellIdentifier @"CellIdentifier"

@interface ViewController ()
@property(strong, nonatomic) NSDictionary *dictData;
@property(strong, nonatomic) NSArray *listData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//
//    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"contacts" ofType:@"plist"];
//
//    self.dictData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
//    self.listData = [self.dictData allKeys];
//    self.title = @"联系人信息";
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"contacts" ofType:@"plist"];
    self.dictData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
//
    NSArray *tempList = [self.dictData allKeys];
    self.listData = [tempList sortedArrayUsingSelector:@selector(compare:)];
//
//    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
//    [self.view addSubview:self.tableView];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger selectedIndex = [indexPath row];

    NSDictionary *dict = self.listData[(NSUInteger) selectedIndex];
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithStyle:UITableViewStylePlain];
    NSString *selectName = self.listData[(NSUInteger) selectedIndex];
    detailViewController.listData = self.dictData[selectName];
    detailViewController.title = selectName;
//    detailViewController.url = dict[@"url"];
//    detailViewController.title = ditc[@"name"];

    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return [self.listData count];
    NSString *groupName = self.listData[(NSUInteger) section];
    NSArray *listContacts = self.dictData[groupName];
    return [listContacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CellIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];

    NSUInteger section = (NSUInteger) [indexPath section];
    NSUInteger row = (NSUInteger) [indexPath row];
    NSString *groupName = self.listData[section];
    NSArray *listContacts = self.dictData[groupName];

    cell.textLabel.text = listContacts[row];

    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.listData count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *groupName = self.listData[(NSUInteger) section];
    return groupName;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *listTitles = [[NSMutableArray alloc] init];
    for (NSString *item in self.listData) {
        NSString *title = [item substringToIndex:1];
        [listTitles addObject:title];
    }
    return listTitles;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
