//
//  TTRegisterViewController.m
//  TTContact
//
//  Created by sxc on 14-3-11.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import "TTRegisterViewController.h"

@interface TTRegisterViewController ()

@end

@implementation TTRegisterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)initNavigationItems
{
    [super initNavigationItems];
    self.title = @"注册";
}

- (void)initSubviews
{
    [super initSubviews];
    UIView *usernameLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, CGRectGetHeight(self.userNameTextField.frame))];
    UIView *phoneLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, CGRectGetHeight(self.phoneTextField.frame))];
    UIView *psdLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, CGRectGetHeight(self.psdTextField.frame))];
    UIView *psdConLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, CGRectGetHeight(self.psdConfirmTextField.frame))];
    self.userNameTextField.leftViewMode = UITextFieldViewModeAlways;
    self.psdTextField.leftViewMode = UITextFieldViewModeAlways;
    self.phoneTextField.leftViewMode = UITextFieldViewModeAlways;
    self.psdConfirmTextField.leftViewMode = UITextFieldViewModeAlways;
    self.userNameTextField.leftView = usernameLeftView;
    self.phoneTextField.leftView = phoneLeftView;
    self.psdTextField.leftView = psdLeftView;
    self.psdConfirmTextField.leftView = psdConLeftView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button click

- (IBAction)registerButton:(id)sender
{
    NSString *username = [_userNameTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *phone = [_phoneTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *psd = [_psdTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *psdconf = [_psdConfirmTextField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
    //有效性判断
    if (username.length == 0 || psd.length == 0 || phone.length == 0 || psdconf.length == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"注册失败" message:@"所有信息都不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    } else if (![psd isEqualToString:psdconf]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"注册失败" message:@"两次输入的密码不一致" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
    } else {
        NSString *psdMD5 = [TTContactHelper md5:psd];
        NSString *url = [NSString stringWithFormat:LOGIN_URL,username,psdMD5];
        //发起请求
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager POST:url
          parameters:nil
             success:^(AFHTTPRequestOperation *operation, id responseObject) {
                 NSLog(@"JSON: %@", responseObject);
             }   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 NSLog(@"Error: %@", error);
             }];
    }
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
