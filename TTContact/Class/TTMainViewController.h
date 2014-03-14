//
//  TTMainViewController.h
//  TTContact
//
//  Created by sxc on 14-3-11.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTCommViewController.h"

@interface TTMainViewController : TTCommViewController
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *registerButton;

@end
