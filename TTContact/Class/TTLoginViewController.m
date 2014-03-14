//
//  TTLoginViewController.m
//  TTContact
//
//  Created by sxc on 14-3-11.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import "TTLoginViewController.h"

@interface TTLoginViewController ()

@end

@implementation TTLoginViewController

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
    self.title = @"登录";
}

- (void)initSubviews
{
    [super initSubviews];
    UIView *userLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, CGRectGetHeight(self.usernameTextField.frame))];
    UIView *psdLeftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 20, CGRectGetHeight(self.usernameTextField.frame))];
    self.usernameTextField.leftViewMode = UITextFieldViewModeAlways;
    self.psdTextField.leftViewMode = UITextFieldViewModeAlways;
    self.usernameTextField.leftView = userLeftView;
    self.psdTextField.leftView = psdLeftView;
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

- (IBAction)loginButtonClick:(id)sender {
    NSString *username = [_usernameTextField.text stringByReplacingOccurrencesOfString:@" "
                                                                            withString:@""];
    NSString *psd = [_psdTextField.text stringByReplacingOccurrencesOfString:@" "
                                                                  withString:@""];
    
    //有效性判断
    if (0 == username.length || 0 == psd.length) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"逗你玩呢~"
                                                        message:@"不准为空"
                                                       delegate:nil
                                              cancelButtonTitle:@"流弊"
                                              otherButtonTitles:nil, nil];
        [alert show];
    } else {
        NSString *psdMD5 = [TTContactHelper md5:psd];
        NSString *url = [NSString stringWithFormat:LOGIN_URL,username,psdMD5];
        NSLog(@"%@",url);
        //发起请求
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:url
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
