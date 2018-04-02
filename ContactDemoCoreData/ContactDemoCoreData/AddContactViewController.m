//
//  AddContactViewController.m
//  ContactDemoCoreData
//
//  Created by 侯凌霄 on 2018/4/2.
//  Copyright © 2018 houlx.ssdut. All rights reserved.
//

#import "AddContactViewController.h"
#import "ViewController.h"

@interface AddContactViewController () <UITextFieldDelegate, UITextViewDelegate>

@end

@implementation AddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(saveContact:)];

    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat textFieldWidth = 223;
    CGFloat textFieldHeight = 30;
    CGFloat textFieldTopView = 150;

    textFieldName = [[UITextField alloc] initWithFrame:CGRectMake((screen.size.width - textFieldWidth) / 2, textFieldTopView, textFieldWidth, textFieldHeight)];

    textFieldName.borderStyle = UITextBorderStyleRoundedRect;
    textFieldName.delegate = self;
    textFieldName.returnKeyType = UIReturnKeyNext;
    textFieldName.keyboardType = UIKeyboardTypeDefault;

    [self.view addSubview:textFieldName];

    CGFloat labelNameTextFieldSpace = 30;
    labelName = [[UILabel alloc] initWithFrame:CGRectMake(textFieldName.frame.origin.x, textFieldName.frame.origin.y - labelNameTextFieldSpace, 51, 21)];

    labelName.text = @"Name";
    [self.view addSubview:labelName];

    textFieldPhone = [[UITextField alloc] initWithFrame:CGRectMake((screen.size.width - textFieldWidth) / 2, textFieldTopView + 80, textFieldWidth, textFieldHeight)];
    textFieldPhone.borderStyle = UITextBorderStyleRoundedRect;
    textFieldPhone.delegate = self;
    textFieldPhone.returnKeyType = UIReturnKeyNext;
    textFieldPhone.keyboardType = UIKeyboardTypePhonePad;
    [self.view addSubview:textFieldPhone];


    labelPhone = [[UILabel alloc] initWithFrame:CGRectMake(textFieldPhone.frame.origin.x, textFieldPhone.frame.origin.y - labelNameTextFieldSpace, 51, 21)];
    labelPhone.text = @"Phone";
    [self.view addSubview:labelPhone];

    textFieldAddr = [[UITextField alloc] initWithFrame:CGRectMake((screen.size.width - textFieldWidth) / 2, textFieldTopView + 160, textFieldWidth, textFieldHeight)];
    textFieldAddr.borderStyle = UITextBorderStyleRoundedRect;
    textFieldAddr.delegate = self;
    textFieldAddr.returnKeyType = UIReturnKeyGo;
    textFieldAddr.keyboardType = UIKeyboardTypeDefault;
    [self.view addSubview:textFieldAddr];

    labelAddr = [[UILabel alloc] initWithFrame:CGRectMake(textFieldAddr.frame.origin.x, textFieldAddr.frame.origin.y - labelNameTextFieldSpace, 70, 21)];
    labelAddr.text = @"Address";
    [self.view addSubview:labelAddr];

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

- (void)saveContact:(id)sender {
    if (sender == self.navigationItem.rightBarButtonItem) {
        self.upperViewController.name = textFieldName.text;
        self.upperViewController.phone = textFieldPhone.text;
        self.upperViewController.addr = textFieldAddr.text;
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
