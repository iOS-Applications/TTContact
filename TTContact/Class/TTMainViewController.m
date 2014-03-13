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
    }
    return self;
}

- (void)initNavigationItems
{
    [super initNavigationItems];
    self.title = @"界面入口";
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
