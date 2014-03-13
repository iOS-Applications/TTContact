//
//  TTCommTableViewController.m
//  TTContacts
//
//  Created by zhoonchen on 14-2-26.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import "TTCommTableViewController.h"
#import "TTCommUI.h"
#import "TTCommTableView.h"

@interface TTCommTableViewController ()
@property(nonatomic, assign) UITableViewStyle style;
@end

@implementation TTCommTableViewController

#pragma mark - init

- (id)init
{
    return [self initWithStyle:UITableViewStylePlain];
}

- (id)initWithStyle:(UITableViewStyle)style
{
    if (self = [super init])
    {
        _style = style;
    }
    return self;
}

- (void)initSubviews
{
    [super initSubviews];
    [self initTableview];
}

- (void)initTableview
{
    if (IOS_VERSION >= 7) {
        _tableView = [[TTCommTableView alloc] initWithFrame:CGRectMakeWithSize(CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))) style:self.style];
    } else {
        _tableView = [[TTCommTableView alloc] initWithFrame:CGRectMakeWithSize(CGSizeMake(CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - NAVIGATIONBAR_HEIGHT - CGRectGetHeight(self.tabBarController.tabBar.frame))) style:self.style];
    }
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
}

#pragma mark - TableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}

- (void)deselectSelectedCellWithAnimated:(BOOL)animated
{
    NSIndexPath *selectedIndexPath = [_tableView indexPathForSelectedRow];
    [_tableView deselectRowAtIndexPath:selectedIndexPath animated:animated];
}

#pragma mark - 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.tableView.style == UITableViewStylePlain) {
        self.view.backgroundColor = [UIColor whiteColor];
    } else {
        self.view.backgroundColor = BackgroudColor;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self deselectSelectedCellWithAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
