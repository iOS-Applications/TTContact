//
//  TTCommTableViewController.h
//  TTContacts
//
//  Created by zhoonchen on 14-2-26.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import "TTCommViewController.h"

@class TTCommTableView;

@interface TTCommTableViewController : TTCommViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) TTCommTableView *tableView;

- (id)initWithStyle:(UITableViewStyle)style; // 默认的init方法
- (id)init; // 等同于[self initWithStyle:UITableViewStylePlain]

// 子类继承
- (void)initTableview;

@end
