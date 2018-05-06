//
//  ViewController.m
//  AddrBook
//
//  Created by 侯凌霄 on 2018/5/4.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import "ViewController.h"
#import "ContactListViewController.h"
#import <BmobSDK/BmobUser.h>

@interface ViewController () <UITextFieldDelegate, UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
//    BmobUser *localuser = [BmobUser currentUser];
//    if (localuser) {
//        [self performSegueWithIdentifier:@"contactlist" sender:self];
//    }
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)onClick:(id)sender {
    [BmobUser loginWithUsernameInBackground:self.username.text password:self.password.text block:^(BmobUser *user, NSError *error) {
        if (user) {
//            [self performSegueWithIdentifier:@"contactlist" sender:self];
            [self dismissViewControllerAnimated:YES completion:nil];
        } else {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Login Failed" message:@"Invalid Account or Password" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *OKAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
            [alertController addAction:OKAction];
            [self presentViewController:alertController animated:true completion:nil];
        }
    }];
}

-(IBAction)backToLoginSegue:(UIStoryboardSegue *)sender{
//    NSLog(@"unwindSegue %@", sender);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        return NO;
    }
    return YES;
}
@end
