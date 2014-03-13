//
//  TTButton.h
//  TTContacts
//
//  Created by zhoonchen on 14-2-27.
//  Copyright (c) 2014年 Telite. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTCommUI.h"

#define TTNavigationButtonHeight (IS_LANDSCAPE ? 25 : 31)
#define TTButtonFont UIFontMake(17)
#define TTButtonFontBold UIFontBoldMake(17)

typedef enum {
    TTNavigationButtonTypeNormal,   // 普通导航栏按钮，最小宽度以2个中文字符为准，最大宽度以4个中文字符为准，一般用于“取消”，“关闭”等
    TTNavigationButtonTypeBold,     // 导航栏蓝色按钮，与normal的区别就是加粗，一般用于“确定”，“完成”等
    TTNavigationButtonTypeBack,     // 导航栏返回按钮（自定义返回按钮）
    TTNavigationButtonTypeIcon      // 与normal一致，文字换成图标，宽度较小。使用initWithType:初始化，使用setImage:forState:来设置图标
} TTNavigationButtonType;


@interface TTButton : UIButton

+ (void)renderButtonAppearanceStyle;

@end

// 用于导航栏的按钮
@interface TTNavigationButton : UIButton

- (id)initWithType:(TTNavigationButtonType)type;
- (id)initWithType:(TTNavigationButtonType)type title:(NSString *)title;
- (id)initWithImage:(UIImage *)image;

+ (UIBarButtonItem *)backBarButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)selector;
+ (UIBarButtonItem *)barButtonItemWithNavigationButton:(TTNavigationButton *)button target:(id)target action:(SEL)selector;
+ (UIBarButtonItem *)barButtonItemWithType:(TTNavigationButtonType)type title:(NSString *)title target:(id)target action:(SEL)selector;
+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image target:(id)target action:(SEL)selector;;

@end
