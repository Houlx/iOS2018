//
//  ModifyPasswordTableViewController.h
//  AddrBook
//
//  Created by 侯凌霄 on 2018/5/6.
//  Copyright © 2018年 houlx.ssdut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BmobSDK/BmobUser.h>

@interface ModifyPasswordTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *oldPassword;
@property (weak, nonatomic) IBOutlet UITextField *changePassword;
@property (weak, nonatomic) IBOutlet UITextField *confirmNewPassword;

@end
