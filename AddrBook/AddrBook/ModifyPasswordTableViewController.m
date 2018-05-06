//
//  ModifyPasswordTableViewController.m
//  AddrBook
//
//  Created by 侯凌霄 on 2018/5/6.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import "ModifyPasswordTableViewController.h"

@interface ModifyPasswordTableViewController () <UITextFieldDelegate>

@end

@implementation ModifyPasswordTableViewController
- (IBAction)saveNewPassword:(id)sender {
    BmobUser *user = [BmobUser currentUser];
    if ([self.changePassword.text isEqualToString:self.confirmNewPassword.text]) {
        [user updateCurrentUserPasswordWithOldPassword:self.oldPassword.text newPassword:self.changePassword.text block:^(BOOL isSuccessful, NSError *error) {
            if (isSuccessful) {
                [BmobUser loginInbackgroundWithAccount:[user username] andPassword:self.changePassword.text block:^(BmobUser *user, NSError *error) {
                    if (error) {
                        NSLog(@"login error:%@", error);
                    } else {
                        [self dismissViewControllerAnimated:TRUE completion:nil];
                        NSLog(@"user:%@", user);
                    }
                }];
            } else {
                UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Wrong Old Password" message:@"" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
                [alertController addAction:OKAction];
                [self presentViewController:alertController animated:true completion:nil];
            }
        }];
    } else {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"两次输入新密码不一致" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alertController addAction:OKAction];
        [self presentViewController:alertController animated:true completion:nil];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

#pragma mark - Table view data source

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
