//
//  DetailTableViewController.m
//  AddrBook
//
//  Created by 侯凌霄 on 2018/5/6.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import "DetailTableViewController.h"

@interface DetailTableViewController ()
@property(weak, nonatomic) IBOutlet UILabel *office;
@property(weak, nonatomic) IBOutlet UIButton *personalPhoneBtn;
@property(weak, nonatomic) IBOutlet UIButton *officePhoneBtn;
@property(weak, nonatomic) IBOutlet UIButton *emailBtn;

@end

@implementation DetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

    self.office.text = [self.contact office];
    [self.personalPhoneBtn setTitle:self.contact.phonePersonal forState:UIControlStateNormal];
    [self.officePhoneBtn setTitle:self.contact.phoneOffice forState:UIControlStateNormal];
    [self.emailBtn setTitle:self.contact.email forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

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
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
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
- (IBAction)onPersonalPhoneClick:(id)sender {
    NSString *number = self.contact.phonePersonal;
    NSString *url = [NSString stringWithFormat:@"tel://%@", number];
    [self openUrl:url];
}

- (IBAction)onOfficePhoneClick:(id)sender {
    NSString *number = self.contact.phoneOffice;
    NSString *url = [NSString stringWithFormat:@"tel://%@", number];
    [self openUrl:url];
}

- (IBAction)onEmailClick:(id)sender {
    NSString *address = self.contact.email;
    NSString *url = [NSString stringWithFormat:@"mailto://%@", address];
    [self openUrl:url];
}

- (void)openUrl:(NSString *)urlStr {
    NSURL *url = [NSURL URLWithString:urlStr];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}
@end
