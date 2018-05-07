//
//  MeTableViewController.m
//  AddrBook
//
//  Created by 侯凌霄 on 2018/5/5.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import "MeTableViewController.h"

@interface MeTableViewController ()
@property(weak, nonatomic) IBOutlet UILabel *username;


@end

@implementation MeTableViewController
- (IBAction)onFeedbackClick:(id)sender {
    NSString *webUrl = @"https://github.com/Houlx/iOS2018/issues/new";
    NSURL *url = [NSURL URLWithString:webUrl];
    [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil];
}

- (IBAction)onLogOutClick:(id)sender {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Log Out" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *NoAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *YesAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self performSegueWithIdentifier:@"logout" sender:self];
        [BmobUser logout];
    }];
    [alertController addAction:NoAction];
    [alertController addAction:YesAction];
    [self presentViewController:alertController animated:true completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.username.text = [[BmobUser currentUser] username];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.username.text = [[BmobUser currentUser] username];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backToMeSegue:(UIStoryboardSegue *)sender {
}

#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

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

@end
