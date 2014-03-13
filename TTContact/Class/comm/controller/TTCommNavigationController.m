//
//  TTCommNavigationController.m
//  TTContacts
//
//  Created by zhoonchen on 14-2-26.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import "TTCommNavigationController.h"
#import "TTCommUI.h"

@interface TTCommNavigationController ()

@end

@implementation TTCommNavigationController

- (id)init {
    if (self = [super init]) {
        [self formatBarStyle];
    }
    return self;
}

- (id)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super initWithRootViewController:rootViewController]) {
        [self formatBarStyle];
    }
    return self;
}

- (void)formatBarStyle {
    if (IOS_VERSION >= 7) {
//        [self.navigationBar setBackgroundImage:[[UIImage imageNamed:@"navigationbar_bg"] stretchableImageWithLeftCapWidth:1 topCapHeight:1] forBarMetrics:UIBarMetricsDefault];
        //    清除navigationbar的1px边框
        if ([self.navigationBar respondsToSelector:@selector(setShadowImage:)]) {
            [self.navigationBar setShadowImage:[[UIImage alloc] init]];
        }
//        [self.toolbar setBackgroundImage:[UIImage imageNamed:@"toolbar_bg"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        //    清除toolbar的1px边框
//        if ([self.toolbar respondsToSelector:@selector(setShadowImage:forToolbarPosition:)]) {
//            [self.toolbar setShadowImage:[[UIImage alloc] init] forToolbarPosition:UIBarPositionAny];
//        }
        [self.navigationBar setTranslucent:NO];
        [self.navigationBar setTintColor:UIColorWhite];
        [self.navigationBar setBarTintColor:TintColorNormal];
//        [self.toolbar setTintColor:TintColorText];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
