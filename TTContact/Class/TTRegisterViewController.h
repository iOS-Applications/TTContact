//
//  TTRegisterViewController.h
//  TTContact
//
//  Created by sxc on 14-3-11.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTCommViewController.h"
#import "TTContactHelper.h"

@interface TTRegisterViewController : TTCommViewController

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *psdTextField;
@property (weak, nonatomic) IBOutlet UITextField *psdConfirmTextField;
- (IBAction)registerButton:(id)sender;

@end
