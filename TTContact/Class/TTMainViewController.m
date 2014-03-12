//
//  TTMainViewController.m
//  TTContact
//
//  Created by sxc on 14-3-11.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import "TTMainViewController.h"
#import "TTLoginViewController.h"
#import "TTRegisterViewController.h"

@interface TTMainViewController ()

@end

@implementation TTMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        NSString *url = @"http://mrobot.pcbaby.com.cn/v3/cmt/new_topics/12958224?articleId=1147610&reverse=0&pageNo=1&pageSize=20#";
        [manager GET:url
          parameters:nil
             success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"JSON: %@", responseObject);
        }   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];
    }
    return self;
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
    TTLoginViewController *loginController = [[TTLoginViewController alloc] initWithNibName:@"TTLoginViewController" bundle:nil];
    [self.navigationController pushViewController:loginController animated:YES];
}

- (IBAction)registerButtonClick:(id)sender {
    TTRegisterViewController *registerController = [[TTRegisterViewController alloc] initWithNibName:@"TTRegisterViewController" bundle:nil];
    [self.navigationController pushViewController:registerController animated:YES];
}

@end
