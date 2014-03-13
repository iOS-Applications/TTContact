//
//  TTCommViewController.h
//  TTContacts
//
//  Created by zhoonchen on 14-2-26.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTNavigationTitleView.h"

@interface TTCommViewController : UIViewController<TTNavigationTitleViewDelegate>

@property(nonatomic,strong,readonly) TTNavigationTitleView *titleView; // 统一的自定义titleView，使用TTNavigationTitleView的接口去更改设置，而不要重新生成

// 子类继承
- (void)initSubviews;
- (void)initNavigationItems;
- (void)didLayoutSubviews;

@end
