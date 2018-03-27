//
//  ContactsViewController.m
//  WeChatDemo
//
//  Created by 侯凌霄 on 2018/3/21.
//  Copyright © 2018 hou.ssdut. All rights reserved.
//

#import "ContactsViewController.h"

@interface ContactsViewController ()

@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"contacts" ofType:@"plist"];

    self.dictData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];

    NSArray *tempList = [self.dictData allKeys];
    self.listGroupName = [tempList sortedArrayUsingSelector:@selector(compare:)];

    self.functions = @[@"New Friends", @"Group Chat", @"Tags", @"Official Accounts"];
    self.funcIcons = @[@"New_Friends", @"Group_Chat", @"Tags", @"Official_Accounts"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.listGroupName count] + 1;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    } else {
        NSString *groupName = self.listGroupName[(NSUInteger) section - 1];
        return groupName;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 4;
    } else {
        NSString *groupName = self.listGroupName[(NSUInteger) section - 1];
        NSArray *listNames = self.dictData[groupName];
        return [listNames count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier1];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier2];

    UITableViewCell *cell = nil;
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier1 forIndexPath:indexPath];
        NSUInteger row = (NSUInteger) [indexPath row];
        cell.textLabel.text = self.functions[row];
        cell.imageView.image = [UIImage imageNamed:self.funcIcons[row]];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier2 forIndexPath:indexPath];
        NSUInteger section = (NSUInteger) [indexPath section] - 1;
        NSUInteger row = (NSUInteger) [indexPath row];
        NSString *groupName = self.listGroupName[section];
        NSArray *listNames = self.dictData[groupName];

        cell.textLabel.text = listNames[row];
        cell.imageView.image = [UIImage imageNamed:@"Me.png"];
    }

    return cell;
}

- (nullable NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *listTitles = [[NSMutableArray alloc] init];
    for (NSString *item in self.listGroupName) {
        NSString *title = [item substringToIndex:1];
        [listTitles addObject:title];
    }
    return listTitles;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the arrayTitle, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
