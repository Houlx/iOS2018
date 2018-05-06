//
//  ContactListViewController.m
//  AddrBook
//
//  Created by 侯凌霄 on 2018/5/4.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import "ContactListViewController.h"

@interface ContactListViewController ()

@end

@implementation ContactListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    BmobUser *localUser = [BmobUser currentUser];
    if (!localUser) {
        [self performSegueWithIdentifier:@"login" sender:self];
    }

    self.listContact = [NSMutableArray array];
    [self searchTable];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchTable {
    [self.listContact removeAllObjects];
    BmobQuery *query = [BmobQuery queryWithClassName:@"Contact"];
    [query orderByDescending:@"name"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        for (BmobObject *object in array) {
            Contact *contact = [[Contact alloc] init];
            contact.name = [object objectForKey:@"name"];
            contact.office = [object objectForKey:@"office"];
            contact.phoneOffice = [object objectForKey:@"phoneOffice"];
            contact.phonePersonal = [object objectForKey:@"phonePersonal"];
            contact.email = [object objectForKey:@"email"];
            [self.listContact addObject:contact];
        }
        [self.tableView reloadData];
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listContact count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    NSUInteger row = (NSUInteger) [indexPath row];
    Contact *contact = (Contact *) self.listContact[row];
    cell.textLabel.text = contact.name;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"ShowDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSInteger selectedIndex = indexPath.row;

        DetailTableViewController *detailTableViewController = segue.destinationViewController;
        Contact *selectedContact = self.listContact[(NSUInteger) selectedIndex];
        detailTableViewController.contact = selectedContact;
        detailTableViewController.title = selectedContact.name;
    }
}


@end
