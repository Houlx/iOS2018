//
//  RegisterViewController.h
//  AddrBook
//
//  Created by 侯凌霄 on 2018/5/4.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController

@property(weak, nonatomic) IBOutlet UITextField *username;
@property(weak, nonatomic) IBOutlet UITextField *password;

- (IBAction)save:(id)sender;

- (IBAction)cancel:(id)sender;

@end
