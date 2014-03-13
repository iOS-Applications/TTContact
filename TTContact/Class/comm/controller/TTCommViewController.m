//
//  TTCommViewController.m
//  TTContacts
//
//  Created by zhoonchen on 14-2-26.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import "TTCommViewController.h"
#import "TTCommUI.h"

@interface TTCommViewController ()

@end

@implementation TTCommViewController

- (id)init
{
    self = [super init];
    if (self) {
        // 初始化titleView
        _titleView = [[TTNavigationTitleView alloc] initWithType:TTNavigationTitleViewTypeNormal];
        self.titleView.delegate = self;
        
        //即使navbar使用图片，tableview也是从(0, 0)开始
        if ([self respondsToSelector:@selector(extendedLayoutIncludesOpaqueBars)]) {
            self.extendedLayoutIncludesOpaqueBars = YES;
        }
    }
    return self;
}

- (void)loadView
{
    [super loadView];
    //加载子视图的操作最好放在loadview中
    [self initNavigationItems];
	[self initSubviews];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = BackgroudColor;
}

- (void)viewDidLayoutSubviews
{
    [self didLayoutSubviews];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.titleView.shouldLayoutSubviews = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - to overwrite

- (void)initSubviews
{
    
}

- (void)didLayoutSubviews
{
    //
}

#pragma mark - navigationbar setting 
- (void)initNavigationItems
{
    self.navigationItem.titleView = self.titleView;
}

// 建议使用setTitle:来设置title，这样可以让子界面利用父界面的title自动设置返回按钮的文字(在initNavigationItems里面设置self.title=xxx)
- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    [self.titleView setTitle:title];
}

@end
