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
        NSString *pwdMD5 = [self md5:psd];
        NSString *url = [NSString stringWithFormat:LOGIN_URL,username,pwdMD5];
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - instance method

//对目标字符串进行MD5加密
- (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                                        result[0], result[1], result[2], result[3],
                                        result[4], result[5], result[6], result[7],
                                        result[8], result[9], result[10], result[11],
                                        result[12], result[13], result[14], result[15]
                                        ];
}
@end
