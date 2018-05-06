//
//  ContactListViewController.m
//  AddrBook
//
//  Created by 侯凌霄 on 2018/5/4.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import "ContactListViewController.h"

@interface ContactListViewController () <UISearchBarDelegate>
@property(weak, nonatomic) IBOutlet UISearchBar *searchBar;


@end

@implementation ContactListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.view.backgroundColor = [UIColor whiteColor];

    self.searchBar.delegate = self;

    BmobUser *localUser = [BmobUser currentUser];
    if (!localUser) {
        [self performSegueWithIdentifier:@"login" sender:self];
    }

    self.listContact = [NSMutableArray array];
    [self searchTable];
    self.listFilterContact = [NSMutableArray arrayWithArray:self.listContact];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if ([searchText isEqualToString:@""]) {
//        self.listFilterContact = self.listContact;
        self.listFilterContact = [NSMutableArray arrayWithArray:self.listContact];
    } else {
//        for (Contact *contact in self.listContact) {
////            if ([contact.name hasPrefix:searchText]) {
////                [self.listFilterContact addObject:contact];
////            }
//            NSRange text = [contact.name rangeOfString:searchText options:NSCaseInsensitiveSearch];
//            if (text.location != NSNotFound) {
//                [self.listFilterContact addObject:contact];
//            }
//        }
        [self.listFilterContact removeAllObjects];
        [self.listContact enumerateObjectsUsingBlock:^(Contact *contact, NSUInteger index, BOOL *stop) {
            if ([contact.name rangeOfString:searchText options:NSCaseInsensitiveSearch].location != NSNotFound) {
                *stop = YES;
                if (*stop == YES) {
                    [self.listFilterContact addObject:contact];
                }

            }

        }];
    }
//    for (Contact *contact1 in self.listContact) {
//        NSLog(@"%@", contact1.name);
//    }
    [self.tableView reloadData];
}

- (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.searchBar resignFirstResponder];
    return indexPath;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self.searchBar resignFirstResponder];
}

- (void)searchTable {
//    [self.listContact removeAllObjects];
    BmobQuery *query = [BmobQuery queryWithClassName:@"Contact"];
//    [query orderByDescending:@"name"];
    query.cachePolicy = kBmobCachePolicyCacheThenNetwork;
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
        [self.listContact removeAllObjects];
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
    return [self.listFilterContact count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    NSUInteger row = (NSUInteger) [indexPath row];
    Contact *contact = (Contact *) self.listFilterContact[row];
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
