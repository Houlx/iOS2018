//
//  RegisterViewController.m
//  AddrBook
//
//  Created by 侯凌霄 on 2018/5/4.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import "RegisterViewController.h"
#import <BmobSDK/BmobUser.h>

@interface RegisterViewController () <UITextFieldDelegate, UITextViewDelegate>

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)save:(id)sender {
//        NSDictionary *dictionary = @{@"username": self.username.text};
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"RegisterCompletionNotification" object:nil userInfo:dictionary];
    BmobUser *user = [[BmobUser alloc] init];
    [user setUsername:self.username.text];
    [user setPassword:self.password.text];
    [user signUpInBackgroundWithBlock:^(BOOL isSuccessful, NSError *error) {
        if (isSuccessful) {
            [self dismissViewControllerAnimated:TRUE completion:nil];
            NSLog(@"SIGN UP SUCCESS");
        } else {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sign up Failed" message:@"" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:OKAction];
            [self presentViewController:alertController animated:true completion:nil];
            NSLog(@"%@", error);
        }
    }];
}

//- (IBAction)cancel:(id)sender {
//    [self dismissViewControllerAnimated:TRUE completion:^{
//
//    }];
//}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        return NO;
    }
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
