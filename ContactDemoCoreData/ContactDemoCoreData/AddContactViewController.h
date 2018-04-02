//
//  AddContactViewController.h
//  ContactDemoCoreData
//
//  Created by 侯凌霄 on 2018/4/2.
//  Copyright © 2018 houlx.ssdut. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AddContactViewController : UIViewController {
    UITextField *textFieldName;
    UILabel *labelName;
    UITextField *textFieldPhone;
    UILabel *labelPhone;
    UITextField *textFieldAddr;
    UILabel *labelAddr;
}

@property(nonatomic, strong) ViewController *upperViewController;

@end
