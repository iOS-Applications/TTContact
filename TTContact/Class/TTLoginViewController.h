//
//  TTLoginViewController.h
//  TTContact
//
//  Created by sxc on 14-3-11.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTCommViewController.h"
#import "TTContactHelper.h"

@interface TTLoginViewController : TTCommViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *psdTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end
